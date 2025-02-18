#!/bin/bash

# Create the hidden backup directories if they don't exist
mkdir -p /etc/.kitten
mkdir -p /etc/uved

# Backup Prestashop files
tar -zcvf /etc/.kitten/backup-prestashop.tar.gz /var/www/html/prestashop
cp /etc/.kitten/backup-prestashop.tar.gz /etc/uved/

# Backup MySQL data
tar -zcvf /etc/.kitten/backup-mysql.tar.gz /var/lib/mysql
cp /etc/.kitten/backup-mysql.tar.gz /etc/uved/

# Backup XAMPP configuration
tar -zcvf /etc/.kitten/backup-xampp.tar.gz /opt/lampp/etc
cp /etc/.kitten/backup-xampp.tar.gz /etc/uved/

# Backup Apache (HTTPD) configuration
tar -zcvf /etc/.kitten/backup-httpd.tar.gz /etc/httpd
cp /etc/.kitten/backup-httpd.tar.gz /etc/uved/

# Backup MySQL configuration if files exist
if ls /etc/my* 1> /dev/null 2>&1; then
    tar -zcvf /etc/.kitten/backup-mysql-config.tar.gz /etc/my*
    cp /etc/.kitten/backup-mysql-config.tar.gz /etc/uved/
else
    echo "No MySQL configuration files found in /etc/my*"
fi

# Backup mail directory
tar -zcvf /etc/.kitten/backup-mail.tar.gz /var/mail
cp /etc/.kitten/backup-mail.tar.gz /etc/uved/

# Completion message
echo "Backup process completed successfully."

