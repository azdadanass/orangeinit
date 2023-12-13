
log_folder=~/log
tmp_folder=~/tmp
backup_folder=~/backup/db

error_log=$log_folder/export_db_error.log
dump_file=$tmp_folder/orange.sql
backup_file=$backup_folder/orange-`date +%Y-%m-%d-%H:%M`.7z

mkdir -p $log_folder
mkdir -p $tmp_folder
mkdir -p $backup_folder

ssh backup_server_user@backup_server_ip "mkdir -p ~/backup/db"

mysqldump \
	--defaults-extra-file=~/orangeinit/config.cnf \
	--max_allowed_packet=1G \
	--default-character-set=utf8 \
	--single-transaction=TRUE \
	"orange"  \
	--databases  > $dump_file  2>> $error_log

7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on $backup_file $dump_file  2>> $error_log

scp -r $backup_file backup_server_user@backup_server_ip:/home/backup_server_user/backup/db

rm $dump_file 2>> $error_log

