#Installation:

Install rsync:
```bash
sudo apt-get install rsync -y
```

Generate ssh key:
```bash
ssh-keygen -t rsa
```

Push the ssh key on dc2:
```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub root@DC2
```

Edit ssh config on dc2: 
```bash
nano /etc/ssh/sshd_config
```

Added :
```bash
PermitRootLogin yes
```

Reload ssh :
```bash
service ssh reload
```

Install script :
```bash
git clone https://github.com/do6po/samba_sysvol_repl
cd samba_sysvol_repl

cp params.conf.example params.conf
```

Edit params.conf :
```bash
nano params.conf
```

Run replication :
```bash
sh sysvolrepl.sh
```

