echo "docker run: start"

docker pull "janhalfar/foomo-app-runner:trusty"
#docker run -d -i -t --env FOOMO_RUN_MODE=test --env ENABLE_XDEBUG=true -v '/var/www:/var/www' -v '/var/log/apache2:/var/log/apache2' -v '/vagrant/ssl:/etc/apache2/ssl' -p 80:80 -p 443:443 --name "foomo-apps" -h 'vagrant.local' janhalfar/foomo-app-runner:trusty "/usr/bin/run-foomo-apps.sh"
docker run -d -i -t --env FOOMO_RUN_MODE=test --env ENABLE_XDEBUG=true -v '/var/www:/var/www' -v '/var/log/apache2:/var/log/apache2' -p 80:80 --name "foomo-apps" -h 'vagrant.local' janhalfar/foomo-app-runner:trusty "/usr/bin/run-foomo-apps.sh"
echo "127.0.0.1 vagrant.local" >> /etc/hosts

echo "docker run: end"