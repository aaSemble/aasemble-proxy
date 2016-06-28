#!/bin/sh -x
sanitized_dc=$(echo ${CLUSTER} | tr -d '.:/-')
http GET ${CLUSTER}nodes/ > cluster.json
cat cluster.json
jq '.results[] | .internal_ip' -r < cluster.json
join_arg=$(jq '.results[] | .internal_ip' -r < cluster.json | sed -e 's/ / -join /g' -e 's/^/-join /' | tr '\n' ' ')
sed -e s/%DATACENTER%/${sanitized_dc}/g -i /etc/consul.d/agent.json
consul agent -config-dir /etc/consul.d ${join_arg} &
service nginx start
while true; do consul-template -template "/etc/nginx/nginx.conf.tmpl:/etc/nginx/nginx.conf:service nginx restart || true" ; sleep 1; done
