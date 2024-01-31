script_dir=$(dirname $0)

echo -e "\033[0;32m"
echo -e "config backup database & files "
echo -e "\033[0m"

if [ ! -d "/backup/" ]
then
	echo folder /backup not found
	exit
fi

read -p "Enter backup_server_ip [192.168.1.91] : " backup_server_ip
backup_server_ip=${backup_server_ip:-192.168.1.91}

read -p "Enter backup_server_user [admin] : " backup_server_user
backup_server_user=${backup_server_user:-admin}


cp $script_dir/config.cnf /app/scripts

cp $script_dir/script_template/backup-db.sh /app/scripts/backup-db.sh
sed -i "s/backup_server_ip/$backup_server_ip/g" /app/scripts/backup-db.sh
sed -i "s/backup_server_user/$backup_server_user/g" /app/scripts/backup-db.sh

cp $script_dir/script_template/backup-files.sh /app/scripts/backup-files.sh
sed -i "s/backup_server_ip/$backup_server_ip/g" /app/scripts/backup-files.sh
sed -i "s/backup_server_user/$backup_server_user/g" /app/scripts/backup-files.sh

ssh-keygen -t rsa -f /app/.ssh/id_rsa -q -P ""
ssh-copy-id $backup_server_user@$backup_server_ip


chmod +x /app/scripts/backup-db.sh
chmod +x /app/scripts/backup-files.sh


(crontab -l 2>/dev/null; echo -e "00 19 * * * /app/scripts/backup-db.sh \n00 * * * * /app/scripts/backup-files.sh ") | crontab -