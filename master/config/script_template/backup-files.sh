
log_folder=~/log


mkdir -p ~/log
ssh backup_server_user@backup_server_ip "mkdir -p backup_folder"


rsync -azv ~/files backup_folder  >> ~/log/backup-files-local.log 2>> ~/log/backup-files-local.error.log
rsync -azv ~/files backup_server_user@backup_server_ip:backup_folder  >> ~/log/backup-files-slave.log 2>> ~/log/backup-files-slave.error.log

