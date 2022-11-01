FROM centos:8.4.2105

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*; \
 sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*; \
 dnf install nginx -y; \
 systemctl enable nginx; \
 ln -sf /dev/stdout /var/log/nginx/access.log; \
 ln -sf /dev/stderr /var/log/nginx/error.log;
 
EXPOSE 80

COPY index1.html /usr/share/nginx/html/

ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
