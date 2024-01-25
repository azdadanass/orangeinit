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


echo -e "\033[0;32m"
echo -e "Config slave (you should wait for master server script to finish) "
echo -e "\033[0m"

read -p "Enter master address [192.168.1.90] : " master_ip
master_ip=${master_ip:-192.168.1.90}

read -p "Enter master_log_file address [mysql-bin.000001] : " master_log_file
master_log_file=${master_log_file:-mysql-bin.000001}

read -p "Enter master_log_pos  [861] : " master_log_pos
master_log_pos=${master_log_pos:-861}


mysql -u root -proot -e "CHANGE MASTER TO MASTER_HOST='$master_ip', MASTER_USER='slaveuser', MASTER_PASSWORD='pass', MASTER_LOG_FILE='$master_log_file', MASTER_LOG_POS=$master_log_pos;"
mysql -u root -proot -e "start slave;"
mysql -u root -proot -e "show slave status\G"






