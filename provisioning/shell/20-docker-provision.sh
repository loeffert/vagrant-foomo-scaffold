echo "docker shell provisioning"

docker pull "janhalfar/foomo-app-runner:trusty"
docker run -d -i -t --env FOOMO_RUN_MODE=test --env ENABLE_XDEBUG=true -v '/var/www:/var/www' -v '/var/log/apache2:/var/log/apache2' -v '/vagrant/ssl:/etc/apache2/ssl' -p 80:80 -p 443:443 --name "foomo-apps" -h 'schild-local-test.bestbytes.net schild-cms-local-test.bestbytes.net' janhalfar/foomo-app-runner:trusty "/usr/bin/run-foomo-apps.sh"

echo "127.0.0.1 schild-local-test.bestbytes.net schild-cms-local-test.bestbytes.net" >> /etc/hosts
