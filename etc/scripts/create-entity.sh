#!/bin/bash
export $(grep -v '^#' .env | xargs)

# Create new NGSI-LD Entities
response=$(curl -k -sS -iX POST https://localhost/orion/ngsi-ld/v1/entities \
    -H "Authorization: Bearer $(curl -sS -X POST http://localhost/idm/realms/${REALM_NAME}/protocol/openid-connect/token \
        -H "Content-Type: application/x-www-form-urlencoded" \
        -d "grant_type=password" \
        -d "client_id=${ORION_CLIENT_ID}" \
        -d "client_secret=${ORION_CLIENT_SECRET}" \
        -d "username=${REALM_USERNAME}" \
        -d "password=${REALM_PASSWORD}" | jq -r .access_token)" \
    -H "Content-Type: application/json" \
    -H "Link: <https://uri.etsi.org/ngsi-ld/v1/ngsi-ld-core-context.jsonld>; rel="http://www.w3.org/ns/json-ld#context"; type="application/ld+json"" \
    --data-raw '{
        "id": "urn:ngsi-ld:TemperatureSensor:003",
        "type": "TemperatureSensor",
        "category": {
            "type": "Property",
            "value": "sensor"
        },
        "temperature": {
            "type": "Property",
            "value": 25,
            "unitCode": "CEL"
        }
    }')

status_code=$(echo "$response" | head -n 1 | awk '{print $2}')
echo "$response"
[ "$(echo $response | head -n 1 | awk '{print $2}')" -lt 300 ] && exit 0 || exit 1
