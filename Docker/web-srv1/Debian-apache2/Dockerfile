FROM ubuntu:22.10

RUN apt-get update -y; \
    apt-get install -y apt-utils; \
    apt-get install -y apache2; \
    apt-get install -y apache2-utils; \
    apt-get clean; 

EXPOSE 80

COPY index1.html /var/www/html/

CMD ["apache2ctl", "-D", "FOREGROUND"]
