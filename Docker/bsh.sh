cd /SyncFldr

# -------------------------------------------------------------------
# Debian-apache2
# -------------------------------------------------------------------

cp Debian-apache2.yaml Dockerfile

docker build -t my-deb-apache2:1.0 .

docker images

docker run --name mydebapache2 -d -p 80:80 my-deb-apache2:1.0

docker stop mydebapache2

docker rm mydebapache2

docker image rm my-deb-apache2:1.0

# -------------------------------------------------------------------
# CentOS-nginx
# -------------------------------------------------------------------

cp CentOS-nginx.yaml Dockerfile

docker build -t my-centos-nginx:1.0 .

docker run --name mycentosnginx -d -p 80:80 my-centos-nginx:1.0

docker stop mycentosnginx

docker rm mycentosnginx


# -------------------------------------------------------------------
#  docker compose
# -------------------------------------------------------------------

cp /SyncFldr/index.html ~/shared-folder-volume/

docker-compose up -d

docker-compose down