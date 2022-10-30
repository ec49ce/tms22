FROM centos:8.4.2105

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*; \
 sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*; \
 dnf install -y epel-release nginx; \
 mkdir -p /usr/share/nginx/test-domain/  ;\
 mkdir -p /opt/cert

EXPOSE 80
EXPOSE 433

COPY test-domain.conf /etc/nginx/conf.d/ 
COPY ./mycert /opt/cert
 
ENTRYPOINT ["nginx", "-g", "daemon off;"]