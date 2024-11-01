# Task Scheduler

## How to use the unix task scheduler.

cron jobs are stored at /var/spool/cron/crontabs.

They are not meant to be edited directly.

Use crontab editor command ( crontab -e ) to edit them.

cron logs it's own activity in /var/log/syslog.

0-59 * * * * echo "Hello fron cron" >> /home/username/exampleLogFile.txt


