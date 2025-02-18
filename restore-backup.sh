#!/bin/bash

# Define backup directory
BACKUP_DIR="/etc/.kitten"

# Restore Prestashop files
tar -xzvf "$BACKUP_DIR/backup-prestashop.tar.gz" -C /

# Restore MySQL data
tar -xzvf "$BACKUP_DIR/backup-mysql.tar.gz" -C /

# Restore XAMPP configuration
tar -xzvf "$BACKUP_DIR/backup-xampp.tar.gz" -C /

# Restore Apache (HTTPD) configuration
tar -xzvf "$BACKUP_DIR/backup-httpd.tar.gz" -C /

# Restore MySQL configuration if the backup exists
if [ -f "$BACKUP_DIR/backup-mysql-config.tar.gz" ]; then
    tar -xzvf "$BACKUP_DIR/backup-mysql-config.tar.gz" -C /
else
    echo "No MySQL configuration backup found. Skipping..."
fi

# Restore mail directory
tar -xzvf "$BACKUP_DIR/backup-mail.tar.gz" -C /

# Completion message
echo "Backup restoration completed successfully."
