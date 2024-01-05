read -p "Enter mysql datadir path [/app/dbdata] :" datadir
datadir=${datadir:-/app/dbdata}

sudo systemctl stop mysql
mkdir -p $datadir
sudo rsync -av /var/lib/mysql $datadir
sudo mv /var/lib/mysql /var/lib/mysql.bak

sudo sed -i "/datadir/c\datadir = $datadir/mysql" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo sed -i "/alias \/var\/lib\/mysql/c\alias \/var\/lib\/mysql\/ -> $datadir\/mysql\/," /etc/apparmor.d/tunables/alias
sudo systemctl restart apparmor
sudo mkdir /var/lib/mysql/mysql -p
sudo systemctl start mysql

