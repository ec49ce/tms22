FROM ubuntu:22.10

RUN apt-get update -y; \
    apt-get install -y apt-utils; \
    apt-get install -y apache2; \
    apt-get install -y apache2-utils; \
    apt-get clean;  \
    mkdir -p /opt/cert 

EXPOSE 80
EXPOSE 443

COPY ./mycert/ /opt/cert
COPY test-domain.conf /etc/apache2/sites-available/

RUN a2enmod ssl; \
    a2ensite test-domain.conf ; \ 
    a2dissite 000-default.conf

CMD ["apache2ctl", "-D", "FOREGROUND"]
