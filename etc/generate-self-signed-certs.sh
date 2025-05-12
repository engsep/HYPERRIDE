#!/bin/bash

openssl req -x509 -newkey rsa:2048 -keyout private.key -out certificate.crt -days 365 -nodes -subj "/CN=engsep.duckdns.org"
