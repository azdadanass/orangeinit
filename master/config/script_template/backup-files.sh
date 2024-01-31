log_folder=/app/log
backup_folder=/backup

mkdir -p $log_folder
mkdir -p $backup_folder

ssh backup_server_user@backup_server_ip "mkdir -p $backup_folder"


rsync -azv /app/files $backup_folder  >> $log_folder/backup-files-local.log 2>> $log_folder/backup-files-local.error.log
rsync -azv /app/files backup_server_user@backup_server_ip:$backup_folder  >> $log_folder/backup-files-slave.log 2>> $log_folder/backup-files-slave.error.log

