FROM ubuntu:22.10

RUN apt-get update -y; \
    apt-get install -y apt-utils apache2 apache2-utils; \
    apt-get clean

EXPOSE 80

COPY test-domain.conf /etc/apache2/sites-available/

RUN a2ensite test-domain.conf ; \ 
    a2dissite 000-default.conf

CMD ["apache2ctl", "-D", "FOREGROUND"]
