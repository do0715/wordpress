#!/bin/bash
sudo su -
yum list php
yum -y install epel-release
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum install yum-utils
yum-config-manager --enable remi-php72
yum install php
php -v

yum install -y php php-cli php-mysql httpd
yum install -y wget
wget https://ko.wordpress.org/latest-ko_KR.tar.gz
tar xvfz latest-ko_KR.tar.gz 
yum install -y mysql
export MYSQL_HOST=wordpress.cgwzwvret31j.ap-northeast-2.rds.amazonaws.com
mysql --user=admin --password=It12345! wordpress
CREATE USER 'wordpress' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO wordpress;
FLUSH PRIVILEGES;
Exit
yum install -y httpd
service httpd start
cp -a wordpress/* /var/www/html/
chown apache.apache /var/www/html/*
sed -i 's/DirectoryIndex index.html/DirectoryIndex index.html index.php/g' /etc/httpd/conf/httpd.conf
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sed -i 's/database_name_here/wordpress/g' /var/www/html/wp-config.php
sed -i 's/username_here/wordpress/g' /var/www/html/wp-config.php
sed -i 's/password_here/It12345!/g' /var/www/html/wp-config.php
sed -i 's/localhost/wordpress.cgwzwvret31j.ap-northeast-2.rds.amazonaws.com/g' /var/www/html/wp-config.php
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
systemctl start httpd
systemctl enable httpd


