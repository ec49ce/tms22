FROM centos:8.4.2105

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*; \
 sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*; \
 dnf install -y nginx; \
 mkdir -p /usr/share/nginx/test-domain/ 

EXPOSE 80

COPY test-domain.conf /etc/nginx/conf.d/ 

ENTRYPOINT ["nginx", "-g", "daemon off;"]