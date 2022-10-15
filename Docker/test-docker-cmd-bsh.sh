cd /SyncFldr

# -------------------------------------------------------------------
# Debian-apache2
# -------------------------------------------------------------------

cp Debian-apache2 Dockerfile

docker build -t deb-apache2:1.0 .

docker images

docker run --name my-deb-apache2 -d -p 80:80 deb-apache2:1.0

docker stop my-deb-apache2

docker rm my-deb-apache2

docker image rm deb-apache2:1.0

# -------------------------------------------------------------------
# CentOS-nginx
# -------------------------------------------------------------------

cp CentOS-nginx Dockerfile

docker build -t my-centos-nginx:1.0 .


#apt-utils

#AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message