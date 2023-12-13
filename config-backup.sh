read -p "Enter backup server ip : " backup_server_ip
echo $backup_server_ip

read -p "Enter backup server user : " backup_server_user
echo $backup_server_user

cp ~/orangeinit/script_template/backup-db.sh ~/orangeinit/backup-db.sh
sed -i "s/backup_server_ip/$backup_server_ip/g" ~/orangeinit/backup-db.sh
sed -i "s/backup_server_user/$backup_server_user/g" ~/orangeinit/backup-db.sh