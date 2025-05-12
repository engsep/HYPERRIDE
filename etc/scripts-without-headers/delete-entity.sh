#!/bin/bash
export $(grep -v '^#' .env | xargs)

# Delete NGSI-LD Entities
curl -k -sS -X DELETE https://localhost/orion/ngsi-ld/v1/entities/urn:ngsi-ld:TemperatureSensor:003 \
    -H "Authorization: Bearer $(curl -sS -X POST http://localhost/idm/realms/${REALM_NAME}/protocol/openid-connect/token \
        -H "Content-Type: application/x-www-form-urlencoded" \
        -d "grant_type=password" \
        -d "client_id=${ORION_CLIENT_ID}" \
        -d "client_secret=${ORION_CLIENT_SECRET}" \
        -d "username=${REALM_USERNAME}" \
        -d "password=${REALM_PASSWORD}" | jq -r .access_token)"
echo
