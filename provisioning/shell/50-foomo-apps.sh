echo "foomo-apps shell provisioning: start"

#bootstrap shell environment variables
/vagrant/provisioning/shell/00-bootstrap.sh

#project name (PLEASE CONFIGURE)
projectName=$PROJECT_NAME

#project path
projectSource='/vagrant/provisioning/files/'$projectName'/foomo'
projectTarget='/var/www/'$projectName

#basic auth
if [ -d $projectSource/basicAuth/test ];
then
	echo "copy basic auth"
	rsync -ruog $projectSource/basicAuth/test $projectTarget/var/test
fi

#test configuration
if [ -d $projectSource/config/test ];
then
	echo "copy foomo configuration (runmode test)"
	rm -rf $projectTarget/config/test/*
	rsync -ruog $projectSource/config/test $projectTarget/config
fi

#production configuration
if [ -d $projectSource/config/production ];
then
	echo "copy foomo configuration (runmode production)"
	rm -rf $projectTarget/config/production/*
	rsync -ruog $projectSource/config/production $projectTarget/config
fi

#foomo bert
if [ -f $projectSource/config/bert-test.json ];
then
	echo copy bert config
	cp $projectSource/config/bert-test.json $projectTarget/config
fi


echo "foomo-apps shell provisioning: end"
