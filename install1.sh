#!/bin/bash
sudo su -
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
amazon-linux-extras disable php5.4
amazon-linux-extras enable php7.4
yum install -y php php-cli php-mysqlnd httpd
yum install -y wget
wget https://ko.wordpress.org/latest-ko_KR.tar.gz
tar xvfz latest-ko_KR.tar.gz 
cp -a wordpress/* /var/www/html/
chown apache.apache /var/www/html/*
sed -i 's/DirectoryIndex index.html/DirectoryIndex index.php/g' /etc/httpd/conf/httpd.conf
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sed -i 's/database_name_here/wordpress/g' /var/www/html/wp-config.php
sed -i 's/username_here/admin/g' /var/www/html/wp-config.php
sed -i 's/password_here/It12345!/g' /var/www/html/wp-config.php
sed -i 's/localhost/wordpress.cgwzwvret31j.ap-northeast-2.rds.amazonaws.com/g' /var/www/html/wp-config.php
systemctl start httpd
systemctl enable httpd