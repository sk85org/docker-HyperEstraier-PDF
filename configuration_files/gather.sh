#!/bin/sh
echo /== cron estcmd gather ==/
estcmd gather -cl -il ja -sd -cm /index /source
PATH=$PATH:/usr/local/share/hyperestraier/filter ; export PATH
estcmd gather -cl -fx ".pdf" "H@estfxpdftohtml" -lt -1 -lf -1　-fz -ic UTF-8 -sd -cm /index /source
echo /== finish cron estcmd gather ==/