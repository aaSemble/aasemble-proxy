FROM ubuntu:trusty
RUN apt-get update;apt-get -y dist-upgrade; apt-get install -y nginx unzip wget jq httpie
RUN wget -O consul.zip https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip
RUN wget -O consul-template.zip https://releases.hashicorp.com/consul-template/0.15.0/consul-template_0.15.0_linux_amd64.zip
RUN unzip consul.zip
RUN unzip consul-template.zip
RUN mkdir -p /var/lib/consul /etc/consul.d
RUN mv consul consul-template /usr/bin
ADD agent.json /etc/consul.d
ADD nginx.conf.tmpl /etc/nginx
ADD run.sh /
CMD /run.sh
