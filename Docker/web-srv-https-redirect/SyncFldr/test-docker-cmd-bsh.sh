cd /SyncFldr

# -------------------------------------------------------------------
# Debian-apache2
# -------------------------------------------------------------------

docker build -t my-deb-apache2:1.0 ./Debian-apache2

docker images

docker run --name mydebapache2 -d -p 8080:80 my-deb-apache2:1.0

docker stop mydebapache2

docker rm mydebapache2

docker image rm my-deb-apache2:1.0

# -------------------------------------------------------------------
# CentOS-nginx
# -------------------------------------------------------------------


docker build -t my-centos-nginx:1.0 ./CentOS-nginx

docker run --name mycentosnginx -d -p 8080:80 my-centos-nginx:1.0

docker stop mycentosnginx

docker rm mycentosnginx

docker image rm my-centos-nginx:1.0

# -------------------------------------------------------------------
#  docker compose
# -------------------------------------------------------------------

cp /SyncFldr/index.html ~/shared-folder-volume/

docker-compose up -d

docker-compose ps

docker-compose down