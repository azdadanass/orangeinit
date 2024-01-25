script_dir=$(dirname $0)

read -p "Enter backup folder [/backup] : " backup_folder
backup_folder=${backup_folder:-/backup}


read -p "Enter backup_server_ip [192.168.1.91] : " backup_server_ip
backup_server_ip=${backup_server_ip:-192.168.1.91}

read -p "Enter backup_server_user [admin] : " backup_server_user
backup_server_user=${backup_server_user:-admin}


cp $script_dir/config.cnf ~/scripts

cp $script_dir/script_template/backup-db.sh ~/scripts/backup-db.sh
sed -i "s/backup_folder/$backup_folder/g" ~/scripts/backup-db.sh
sed -i "s/backup_server_ip/$backup_server_ip/g" ~/scripts/backup-db.sh
sed -i "s/backup_server_user/$backup_server_user/g" ~/scripts/backup-db.sh

cp $script_dir/script_template/backup-files.sh ~/scripts/backup-files.sh
sed -i "s/backup_folder/$backup_folder/g" ~/scripts/backup-files.sh
sed -i "s/backup_server_ip/$backup_server_ip/g" ~/scripts/backup-files.sh
sed -i "s/backup_server_user/$backup_server_user/g" ~/scripts/backup-files.sh

ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -P ""
ssh-copy-id $backup_server_user@$backup_server_ip


chmod +x ~/scripts/backup-db.sh
chmod +x ~/scripts/backup-files.sh