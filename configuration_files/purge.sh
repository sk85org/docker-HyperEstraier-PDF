#!/bin/sh
echo /== cron estcmd purge ==/
estcmd purge -cl /index
estcmd extkeys /index
echo /== finish cron estcmd purge ==/
