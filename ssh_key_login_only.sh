#!  /bin/bash
#A script to disable ssh password login  and enable key login. 
#Warning you should copy your public key to your server before execute this script 
#and restart sshd service ,  or you will lose control of your server.
#ssh-copy-id -i $key_path -p $port root@$ip





sed -i  's/^PasswordAuthentication\s*yes$/PasswordAuthentication no/g'   /etc/ssh/sshd_config
sed -i 's/^ChallengeResponseAuthentication\s*yes$/ChallengeResponseAuthentication no/g'  /etc/ssh/sshd_config

sed -i 's/^#RSAAuthentication\s*yes$/RSAAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/#PubkeyAuthentication\s*yes$/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/^#AuthorizedKeysFile \.ssh\/authorized_keys$/AuthorizedKeysFile \.ssh\/authorized_keys/g'   /etc/ssh/sshd_config



#service sshd restart
