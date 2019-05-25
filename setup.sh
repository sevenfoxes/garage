# only run as root.
# if this doesn't work, try fucking around.


# setup an init.d script
cp ./gpio_init.sh /etc/init.d
update-rc.d /etc/init.d/gpio_init.sh defaults
/etc/init.d/gpio_init.sh start

# setup node
curl -sL https://deb.nodesource.com/setup_10.x | bash -
apt-get install -y nodejs gcc g++ make python

# setup homebridge and plugins
npm install -g --unsafe-perm homebridge@latest homebridge-config-ui-x@latest
npm i -g homebridge-platform-wemo homebridge-rasppi-gpio-garagedoor

# make a user for homebridge, let him run shit without a password
# this command might need some tweaking, unclear. Don't want to mess with it
useradd -m --system homebridge
echo 'homebridge    ALL=(ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo

# move the initial homebridge config into place
# (note: config-ui should be used going forward for any updates)
mkdir -p /var/lib/homebridge
cp ./config.json /var/lib/homebridge/config.json

# move homebridge service into place, start it
cp ./homebridge.service /etc/systemd/system/
cp ./hb /etc/default/homebridge
chown -R homebridge: /var/lib/homebridge
systemctl daemon-reload
systemctl enable homebridge
systemctl start homebridge

# install wiringPi
cd /home/pi
git clone git://git.drogon.net/wiringPi
cd ~/wiringPi
./build
