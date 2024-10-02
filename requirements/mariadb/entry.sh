#!/bin/sh

# Check if the database directory is empty
if [ ! -d "/var/lib/mysql/mysql" ]; then
  echo "Initializing database..."
  mysql_install_db --user=mysql --datadir=/var/lib/mysql
  echo "Database initialized."
fi

exec mysqld --datadir=/var/lib/mysql --console