#!/bin/bash

# ------------------------------------------------------------------------------
# .env File Decryption and Environment Variable Loader
#
# This script checks for the existence of a `.env` file. If it's not present,
# it prompts the user for a password and attempts to decrypt the `.env.enc` file
# using OpenSSL. If decryption is successful, the `.env` file is created.
# Finally, it exports all non-commented variables from the `.env` file into the
# current shell session.
# ------------------------------------------------------------------------------

# Check if .env file does not exist
if  [ ! -f .env ]; then
  # Prompt the user to enter a password (silent input)
  read -sp "Enter password to decrypt .env: " PASSWORD
  echo ""

  # Attempt to decrypt the .env.enc file using OpenSSL with AES-256-CBC and PBKDF2
  if ! openssl enc -d -aes-256-cbc -in .env.enc -out .env -pbkdf2 -pass pass:"$PASSWORD"; then
    # If decryption fails, print an error message in red
    echo -e "\e[31mError decrypting .env file.\e[0m"
    # Remove the incomplete or invalid .env file
    rm .env
    # Exit the script with an error code
    exit 1
  fi
  # Inform the user that .env has been successfully created
  echo ".env created"
fi

# If .env exists, export all environment variables from it
if [ -f .env ]; then
  # Exclude comment lines (starting with #) and load the rest as environment variables
  export $(grep -v '^#' .env | xargs)
fi

# ------------------------------------------------------------------------------
# Wazuh SSL Certificate Initialization Script
#
# This script checks whether the necessary SSL certificates for Wazuh Indexer
# exist. If not, it uses a Docker Compose service ('generator') to generate them.
# After generation, it sets the correct file permissions to ensure accessibility.
# ------------------------------------------------------------------------------

# Path to the directory where certificates will be stored
CERTS_DIR="./wazuh/config/wazuh_indexer_ssl_certs"

# Path to the docker-compose file used for certificate generation
CERTS_COMPOSE="./wazuh/certs-compose.yml"

# Check if certificates directory exists
if [ ! -d "$CERTS_DIR" ]; then
  echo "[INIT] Creating certificates directory..."
  # Create the directory if it does not exist
  mkdir -p "$CERTS_DIR"
fi

# Ensure the directory has the correct permissions
sudo chmod 777 "$CERTS_DIR"

# Check if the root certificate file exists (used as an indicator)
if [ ! -f "$CERTS_DIR/root-ca.pem" ]; then
  echo "[INIT] Certificates not found. Generate Wazuh certificates..."

  # Run the 'generator' service defined in the specified docker-compose file
  if docker compose -f "$CERTS_COMPOSE" run --rm generator; then
    echo "[INIT] Certificates generated successfully!"

    # Set full permissions (read/write/execute for all) to ensure other services/containers can access them
    sudo chmod 777 "$CERTS_DIR"
  else
    # Print error if certificate generation fails
    echo "[ERROR] Failed to generate certificates"
  fi
else
  # Certificates already exist; skip generation
  echo "[INIT] Certificates already present, skip generation."
fi

# https://www.duckdns.org/domains (engsep@github)
DUCKDNS_DOMAIN="${DUCKDNS_DOMAIN}"
DUCKDNS_TOKEN="${DUCKDNS_TOKEN}"

echo "DNS: $DUCKDNS_DOMAIN.duckdns.org"
echo "IP4: $(curl -s https://ipv4.icanhazip.com)"
echo "IP6: $(curl -s https://ipv6.icanhazip.com)"

if [[ $(curl -s "https://www.duckdns.org/update?domains=$DUCKDNS_DOMAIN&token=$DUCKDNS_TOKEN&ip=&ipv6=") == *"OK"* ]]
then
  echo -e "\e[32mDuckDNS IP update successful.\e[0m"
else
  echo -e "\e[31mError updating IP on DuckDNS.\e[0m"
fi

if docker run -it --rm -p 80:80 -v $(pwd)/certbot/conf:/etc/letsencrypt certbot/certbot \
  certonly --standalone -d $DUCKDNS_DOMAIN.duckdns.org --register-unsafely-without-email --agree-tos --dry-run -v # --non-interactive
then
  if docker run -it --rm -p 80:80 -v $(pwd)/certbot/conf:/etc/letsencrypt certbot/certbot \
    certonly --standalone -d $DUCKDNS_DOMAIN.duckdns.org  --register-unsafely-without-email --agree-tos -v # --non-interactive
  then
    echo -e "\e[32mCertificate obtained successfully.\e[0m"
  else
    echo -e "\e[31mError obtaining certificate.\e[0m"
  fi
else
  echo -e "\e[31mUnable to obtain certificate (dry-run).\e[0m"
fi

sudo chown -R $(id -u):$(id -g) certbot
