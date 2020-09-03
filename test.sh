#!/usr/bin/env bash

echo 'whoami'
whoami

#echo 'cat sshd_config'
#cat /etc/ssh/sshd_config

echo 'ls -l sshd_config'
ls -l /etc/ssh/sshd_config
echo 'update sshd_config'
echo -e 'PubkeyAuthentication yes\nAuthorizedKeysFile .ssh/authorized_keys' >> /etc/sshd_config

echo 'establish reverse connection'
sshpass -p $SSHPASS ssh -o 'StrictHostKeyChecking=accept-new' -fNR 24661:localhost:22 a23187@hw.a23187.cn
  # -f run ssh and then exit, -N don't open remote shell, -R reverse connect
echo -n 'return status: '
echo $?

echo 'sleep 3min'
sleep $((3*60))

touch ~/.break
while : ; do
    sleep 2
    [ -f ~/.break ] && break
done

echo -e "Bye \u2764"
