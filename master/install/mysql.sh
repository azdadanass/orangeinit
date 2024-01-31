script_dir=$(dirname $0)

echo -e "\033[0;32m"
echo -e "Installation & configuration mysql "
echo -e "\033[0m"



sudo apt update
sudo apt -y install mysql-server



read -p "Enter mysql datadir path [/app/dbdata] :" datadir
datadir=${datadir:-/app/dbdata}

mkdir $datadir
if [ $? -ne 0 ] ; then
    echo "fatal --> exit"
    exit
fi

sudo systemctl stop mysql
mkdir -p $datadir
sudo rsync -av /var/lib/mysql $datadir
sudo mv /var/lib/mysql /var/lib/mysql.bak

sudo sed -i "/datadir/c\datadir = $datadir/mysql" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo sed -i "/alias \/var\/lib\/mysql/c\alias \/var\/lib\/mysql\/ -> $datadir\/mysql\/," /etc/apparmor.d/tunables/alias
echo "alias /var/log/mysql/ -> /app/log/mysql/," | sudo tee -a /etc/apparmor.d/tunables/alias
sudo systemctl restart apparmor
sudo mkdir /var/lib/mysql/mysql -p
sudo systemctl start mysql


# Création de l'utilisateur tomcat dans la base de donnée
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password by 'root';"
mysql -u root -proot -e "CREATE USER 'tomcat'@'%' IDENTIFIED BY 'tacmot';"
mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'tomcat'@'%';"
mysql -u root -proot -e "FLUSH PRIVILEGES;"

sudo cp $script_dir/mysql/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
echo "datadir = $datadir/mysql" | sudo tee -a /etc/mysql/mysql.conf.d/mysqld.cnf

sudo systemctl restart mysql


read -p "Enter slave address [192.168.1.91] : " slave_ip
slave_ip=${slave_ip:-192.168.1.91}

mysql -u root -proot -e "CREATE USER slaveuser@$slave_ip IDENTIFIED WITH mysql_native_password BY 'pass';"
mysql -u root -proot -e "grant replication slave on *.* to slaveuser@$slave_ip;"
mysql -u root -proot -e "flush privileges;"
mysql -u root -proot -e "show grants for slaveuser@$slave_ip;"
mysql -u root -proot -e "show master status\G"





