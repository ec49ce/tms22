FROM ubuntu:22.10

RUN apt-get update -y; \
    apt-get install -y mysql-server; \
    apt-get clean

EXPOSE 3306

CMD ["mysqld","--user","mysql"]

