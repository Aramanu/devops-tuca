#!/usr/bin/env bash
echo "Instalando Apache e configurando firewall..."
dnf install -y httpd
mkdir -p /var/www/html/
cp -r /vagrant/html/. /var/www/html/
systemctl enable httpd
systemctl start httpd

systemctl enable firewalld
systemctl start firewalld
firewall-cmd --permanent --add-service=http
firewall-cmd --reload