#!/bin/sh
chmod +x /cron_configuration/*.*

echo /== Added Cron Jobs==/
cp --force /cron_configuration/cron_configuration /var/spool/cron/crontabs/root
cat /var/spool/cron/crontabs/root
echo 
echo /== First estcmd gather ==/
estcmd gather -cl -il ja -sd -cm /index /source
PATH=$PATH:/usr/local/share/hyperestraier/filter ; export PATH
estcmd gather -cl -fx ".pdf" "H@estfxpdftohtml" -lt -1 -lf -1　-fz -ic UTF-8 -sd -cm /index /source
echo /== Cron Start ==/
crond -l 2 -f