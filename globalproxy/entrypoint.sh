#!/bin/bash
set -eu

cd /etc/nginx/sites

i=0
while [ $i -lt 100 ]
do
    var_name="WEB${i}_ENV_DOMAIN"
    domain=${!var_name-}
    host_name="web${i}"
    template="web.conf.tpl"
    config="${host_name}.conf"

    if [ -r "${host_name}.conf.tpl" ]; then
      template="${host_name}.conf.tpl"
      cp $template $config
    fi

    if [ "${domain}" ]; then
        echo "${host_name}: ${domain}"
        sed "s/{{HOST}}/${host_name}/" $template > $config
        sed -i "s/{{DOMAIN}}/${domain}/" $config
    fi
    let ++i
done

exec "$@"
