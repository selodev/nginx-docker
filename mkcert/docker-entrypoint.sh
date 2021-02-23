#!/bin/sh

set -ea

dir="/tmp/certs"
if [ -z "$(ls -A -- "$dir")" ]; then 
    echo "No Existing Certs Found.";
    mkcert -install && for i in $(echo ${DOMAIN_NAME} | sed "s/,/ /g");
    do mkcert $i; mkcert -pkcs12 $i; done && tail -f -n0 /etc/hosts
else
    echo "Existing Certs Found. Skipped mkcert.";
    exit; 
fi

# Execute the rest of your ENTRYPOINT and CMD as expected.
exec "$@"