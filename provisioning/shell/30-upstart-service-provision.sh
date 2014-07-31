echo "upstart service shell provisioning"

cp /vagrant/vagrant-files/upstart/docker-foomo-apps.conf /etc/init/.
cp /vagrant/vagrant-files/upstart/daemon-garden.conf /etc/init/.

service docker-foomo-apps restart
sleep 5
service daemon-garden restart