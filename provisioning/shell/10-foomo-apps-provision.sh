echo "foomo-apps shell provisioning"

#bootstrap shell environment variables
/vagrant/provisioning/shell/00-boostrap.sh

FOOMO_PROVISIONING

if [ -n "$PROJECT_WWW_ROOT" ]; then
	echo "environment variables not set. run /vagrant/provisioning/shell/00-boostrap.sh first."
	exit 1
else
	rsync -ruog /vagrant/provisioning/files/$PROJECT_NAME/foomo/basicAuth $PROJECT_WWW_ROOT/var/test

	rm -rf $PROJECT_WWW_ROOT/config/test/*
	rsync -ruog /vagrant/provisioning/files/$PROJECT_NAME/foomo/config/test /vagrant/www/schild/config

	rm -rf /vagrant/www/schild/config/production/*
	rsync -ruog /vagrant/provisioning/files/$PROJECT_NAME/foomo/config/production /vagrant/www/schild/config

	cp /vagrant/configs/schild/foomo/bert-test.json /vagrant/www/schild/config
fi