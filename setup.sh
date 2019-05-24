sudo su
curl -sL https://deb.nodesource.com/setup_10.x | bash -
apt-get install -y nodejs gcc g++ make python
npm install -g --unsafe-perm homebridge@latest homebridge-config-ui-x@latest
npm i -g homebridge-platform-wemo homebridge-rasppi-gpio-garagedoor
useradd -m --system homebridge
echo 'homebridge    ALL=(ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo
mkdir -p /var/lib/homebridge
cp ./config.json /var/lib/homebridge/config.json
cp ./homebridge.service /etc/systemd/system/
cp ./hb /etc/default/homebridge
chown -R homebridge: /var/lib/homebridge
systemctl daemon-reload
systemctl enable homebridge
systemctl start homebridge
