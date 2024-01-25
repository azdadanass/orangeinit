script_dir=$(dirname $0)

if [ ! -d "/backup/" ]
then
	echo folder /backup not found
	exit
fi

read -p "Enter backup_server_ip [192.168.1.91] : " backup_server_ip
backup_server_ip=${backup_server_ip:-192.168.1.91}

read -p "Enter backup_server_user [admin] : " backup_server_user
backup_server_user=${backup_server_user:-admin}


cp $script_dir/config.cnf ~/scripts

cp $script_dir/script_template/backup-db.sh ~/scripts/backup-db.sh
sed -i "s/backup_server_ip/$backup_server_ip/g" ~/scripts/backup-db.sh
sed -i "s/backup_server_user/$backup_server_user/g" ~/scripts/backup-db.sh

cp $script_dir/script_template/backup-files.sh ~/scripts/backup-files.sh
sed -i "s/backup_server_ip/$backup_server_ip/g" ~/scripts/backup-files.sh
sed -i "s/backup_server_user/$backup_server_user/g" ~/scripts/backup-files.sh

ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -P ""
ssh-copy-id $backup_server_user@$backup_server_ip


chmod +x ~/scripts/backup-db.sh
chmod +x ~/scripts/backup-files.sh


(crontab -l 2>/dev/null; echo -e "00 19 * * * ~/scripts/backup-db.sh \n00 * * * * ~/scripts/backup-.sh ") | crontab -