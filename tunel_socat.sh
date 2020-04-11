#!/bin/bash

#felipesi - 2017
#desecsecurity

myip=$(curl -s icanhazip.com)

read -p "LOCALPORT TO OPEN: " localport
read -p "LOCALPORT TO CONNECT: " localconnect
read -p "REMOTE IP: " remoteip
read -p "REMOTE PORT TO REDIRECT: " remoteport

socat TCP4-LISTEN:$localport,reuseaddr,fork TCP4-LISTEN:$localconnect,reuseaddr &

echo "#!/bin/bash" > redir.sh
echo "while [ 1 ]" >> redir.sh
echo "do" >> redir.sh
echo "  socat TCP4:$myip:$localport TCP4:$remoteip:$remoteport" >> redir.sh
echo "done" >> redir.sh

echo
echo "DONE! REMOTE SCRIPT AVAILABLE ON: redir.sh"
