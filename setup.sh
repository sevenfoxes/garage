sudo apt-get install apt-transport-https ca-certificates software-properties-common -y
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
sudo usermod -aG docker pi
sudo curl https://download.docker.com/linux/raspbian/gpg
sudo echo "deb https://download.docker.com/linux/raspbian/ stretch stable" >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get upgrade
sudo systemctl start docker.service
docker info
sudo apt-get install -y python python-pip libffi-dev build-essential libssl-dev libffi-dev python3-dev
sudo pip install docker-compose
