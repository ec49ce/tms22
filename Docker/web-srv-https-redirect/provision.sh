sudo apt-get update -y

sudo apt-get install needrestart -y

sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a NEEDRESTART_SUSPEND=1 apt-get upgrade -y

sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" -y

apt-cache policy docker-ce

sudo apt install docker-ce -y

sudo apt install docker-compose -y

sudo usermod -aG docker vagrant

mkdir /home/vagrant/shared-folder

cp /SyncFldr/index.html /home/vagrant/shared-folder/