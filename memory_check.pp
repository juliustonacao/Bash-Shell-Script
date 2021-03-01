cat >/etc/puppet/manifests/memorycheck.pp

node "bpx.agent.local" 

{
file 
{ 
'/root/memory_check.txt':
yum install -y vim
yum install -y curl
yum install -y git
useradd -s /bin/bash monitor
mkdir home/monitor
mkdir /home/monitor/scripts
wget https://github.com/juliustonacao/Bash-Shell-Script/blob/main/Memory_Check.sh -P /home/monitor/scripts/
}
} 



# wget https://github.com/juliustonacao/Bash-Shell-Script/blob/main/Memory_Check.sh -P /home/monitor/scripts/
# download file from my github and set the destination path using -P
