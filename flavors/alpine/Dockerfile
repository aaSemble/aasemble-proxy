FROM alpine:edge
RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing httpie jq unzip nginx wget ca-certificates
RUN wget -O consul.zip https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip ; unzip consul.zip ; mv consul /usr/bin/consul ; rm consul.zip
RUN wget -O consul-template.zip https://releases.hashicorp.com/consul-template/0.15.0/consul-template_0.15.0_linux_amd64.zip ; unzip consul-template.zip ; mv consul-template /usr/bin/consul-template ; rm consul-template.zip
RUN mkdir -p /var/lib/consul /etc/consul.d
ADD agent.json /etc/consul.d
ADD nginx.conf.tmpl /etc/nginx
ADD run.sh /
CMD /run.sh
