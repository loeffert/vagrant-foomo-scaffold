echo "upstart service shell provisioning: start"

cp /vagrant/provisioning/upstart/docker-foomo-apps.conf /etc/init/.
#cp /vagrant/provisioning/upstart/daemon-garden.conf /etc/init/.

service docker-foomo-apps restart
#sleep 5
#service daemon-garden restart

echo "upstart service shell provisioning: end"