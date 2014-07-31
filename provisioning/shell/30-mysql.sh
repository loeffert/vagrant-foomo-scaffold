echo "mysql shell provisioning: start"

MYSQL_PASSWORD="testing"

echo "mysql-server-5.5 mysql-server/root_password password $MYSQL_PASSWORD" | debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password_again password $MYSQL_PASSWORD" | debconf-set-selections
apt-get -y install mysql-client mysql-server-5.5

sleep 5

mysqladmin -u root -p$MYSQL_PASSWORD password ''
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '';flush privileges;" | mysql -u root

# no binding restriction for mysql daemon
cp /etc/mysql/my.cnf /etc/mysql/my.cnf.bu
sed 's/^bind-address/#bind-address/' /etc/mysql/my.cnf.bu > /etc/mysql/my.cnf

service mysql restart
echo "mysql shell provisioning: end"