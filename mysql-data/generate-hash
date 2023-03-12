#!/bin/bash
#
#  Utility to create the hash of the access token in backup.sql (row 238)

if (( $# < 1 )); then
    echo "usage: generate-hash <oauth_access_token>"
    exit 1
fi
node -e "console.log(require('crypto').createHash('sha3-256').update('$1').digest('hex'))"
