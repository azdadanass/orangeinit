read -p "Enter backup server ip : " backup_server_ip
echo $backup_server_ip

read -p "Enter backup server user : " backup_server_user
echo $backup_server_user


cp ~/orangeinit/script_template/backup-db.sh ~/orangeinit/backup-db.sh
sed -i "s/backup_server_ip/$backup_server_ip/g" ~/orangeinit/backup-db.sh
sed -i "s/backup_server_user/$backup_server_user/g" ~/orangeinit/backup-db.sh

cp ~/orangeinit/script_template/backup-files.sh ~/orangeinit/backup-files.sh
sed -i "s/backup_server_ip/$backup_server_ip/g" ~/orangeinit/backup-files.sh
sed -i "s/backup_server_user/$backup_server_user/g" ~/orangeinit/backup-files.sh

ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -P ""
ssh-copy-id $backup_server_user@$backup_server_ip


chmod +x ~/orangeinit/backup-db.sh
chmod +x ~/orangeinit/backup-files.sh