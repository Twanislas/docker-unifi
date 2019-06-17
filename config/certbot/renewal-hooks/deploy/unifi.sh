#!/bin/bash

cp /var/lib/unifi/keystore /var/lib/unifi/keystore.backup.$(date +%F_%R)
openssl pkcs12 -export -inkey /etc/letsencrypt/live/${RENEWED_DOMAINS}/privkey.pem -in /etc/letsencrypt/live/${RENEWED_DOMAINS}/fullchain.pem -out /etc/letsencrypt/live/${RENEWED_DOMAINS}/fullchain.p12 -name unifi -password pass:unifi
keytool -importkeystore -deststorepass aircontrolenterprise -destkeypass aircontrolenterprise -destkeystore /var/lib/unifi/keystore -srckeystore /etc/letsencrypt/live/${RENEWED_DOMAINS}/fullchain.p12 -srcstoretype PKCS12 -srcstorepass unifi -alias unifi -noprompt > /dev/null 2>&1
s6-svc -r /var/run/s6/services/unifi
