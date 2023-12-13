
log_folder=~/log


mkdir -p ~/log
ssh backup_server_user@backup_server_ip "mkdir -p ~/backup/"
rsync -azv ~/files backup_server_user@backup_server_ip:~/backup/   >> ~/log/backup-files.log 2>> ~/log/backup-files.error.log