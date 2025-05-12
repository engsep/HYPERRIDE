#!/bin/bash
export $(grep -v '^#' .env | xargs)

# Read NGSI-LD Entities
response=$(curl -k -sS -i https://localhost/orion/ngsi-ld/v1/entities/urn:ngsi-ld:TemperatureSensor:003 \
    -H "Authorization: Bearer $(curl -sS -X POST http://localhost/idm/realms/${REALM_NAME}/protocol/openid-connect/token \
        -H "Content-Type: application/x-www-form-urlencoded" \
        -d "grant_type=password" \
        -d "client_id=${ORION_CLIENT_ID}" \
        -d "client_secret=${ORION_CLIENT_SECRET}" \
        -d "username=${REALM_USERNAME}" \
        -d "password=${REALM_PASSWORD}" | jq -r .access_token)" \
    -H "Link: <https://uri.etsi.org/ngsi-ld/v1/ngsi-ld-core-context.jsonld>; rel=\"http://www.w3.org/ns/json-ld#context\"; type=\"application/ld+json\"" \
    -G -d "format=concise")

status_code=$(echo "$response" | head -n 1 | awk '{print $2}')
echo "$response"
[ "$(echo $response | head -n 1 | awk '{print $2}')" -lt 300 ] && exit 0 || exit 1

  # -G -d "format=simplified,attrs=temperature" # limit attributes
  # -G -d "format=normalized"
  # -G -d "format=simplified"
  # -G -d "options=sysAttrs" # legacy options
