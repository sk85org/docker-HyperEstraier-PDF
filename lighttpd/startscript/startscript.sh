#!/bin/sh
mkdir -p /www/public/cgi
cp /usr/local/libexec/estseek.cgi /www/public/cgi
cp /configuration/index.html /www/public/index.html
touch //www/public/index.html
chmod 755 /www/public/cgi/estseek.cgi 


for f in /configuration/estseek.*.template
do 
    #echo $f
    outputfile=${f%.template}
    outputfile_basename=${outputfile##*/}
    #echo $outputfile_basename
    envsubst < $f > /www/public/cgi/$outputfile_basename
done

lighttpd -D -f /configuration/lighttpd.conf