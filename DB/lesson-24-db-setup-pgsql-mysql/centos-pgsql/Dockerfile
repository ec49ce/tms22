FROM centos:8.4.2105

EXPOSE 5432

COPY DB-Start-Up.sh /

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*; \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*; \
    yum install -y glibc-langpack-en \
                    https://download.postgresql.org/pub/repos/yum/common/redhat/rhel-8-x86_64/pgdg-redhat-repo-42.0-28.noarch.rpm \ 
                    https://download.postgresql.org/pub/repos/yum/15/redhat/rhel-8-x86_64/postgresql15-libs-15.0-1PGDG.rhel8.x86_64.rpm \
                    https://download.postgresql.org/pub/repos/yum/15/redhat/rhel-8-x86_64/postgresql15-15.0-1PGDG.rhel8.x86_64.rpm \
                    https://download.postgresql.org/pub/repos/yum/15/redhat/rhel-8-x86_64/postgresql15-server-15.0-1PGDG.rhel8.x86_64.rpm \
                    https://download.postgresql.org/pub/repos/yum/15/redhat/rhel-8-x86_64/postgresql15-contrib-15.0-1PGDG.rhel8.x86_64.rpm; \ 
    yum clean all

RUN chown root:root /DB-Start-Up.sh;\
    chmod 777 /DB-Start-Up.sh
    
ENV PGDATA="/var/lib/postgresql/data/pgdata"

USER postgres

CMD ["/bin/bash","-c","/DB-Start-Up.sh && tail -f /dev/null"]
