### git status
What: shows which files changed and what is staged.
When: before every git add, to know where I stand.

# Commands used in this lab

### pwd
What: prints the full path of the folder I'm in.
When: before git add . or anything that depends on location, to avoid working in the wrong folder.

### cd
What: moves me into another folder.
When: entering the repo with cd ~/linux-networking-lab before running Git commands.

### ls -l
What: lists files with permissions, owner and size.
When: checking that a secrets file like ~/.msmtprc is locked down.

### mkdir -p
What: creates a folder, including missing parent folders, with no error if it already exists.
When: creating /var/www/labsite for the website.

### cat
What: prints a file's contents to the screen.
When: confirming a config or README saved correctly.

### nano
What: terminal text editor. Ctrl+O saves, Ctrl+X exits.
When: editing config files and scripts on a server with no GUI.

### cp
What: copies a file to another location.
When: copying the Ubuntu ISO into /var/lib/libvirt/images so libvirt could read it.

### echo "text" >> file
What: appends a line of text to the end of a file (a single > would overwrite it).
When: adding a daily entry to docs/learning-log.md.

### whoami
What: prints the username I'm logged in as.
When: unsure which account I'm in after using su.

### hostname
What: prints the name of the machine I'm on.
When: checking whether I'm on my laptop or the VM before running a command.

### sudo
What: runs a command with administrator rights.
When: installing packages or editing files in /etc.

### ip a
What: lists network interfaces and their IP addresses.
When: finding the VM's IP address so I can SSH into it.

### lsb_release -a
What: shows the Linux distribution and version.
When: confirming which Ubuntu release a server runs.

### df -h
What: shows disk space used and free per filesystem, in readable units.
When: checking disk usage, which my monitoring script uses for the 80% alert.

### free -m
What: shows used and free memory in megabytes.
When: checking memory usage, which my monitoring script reports.

### sudo apt update
What: refreshes the list of available packages (it installs nothing).
When: before installing or upgrading software on a fresh server.

### sudo apt install -y
What: installs a package; -y answers yes automatically.
When: installing nginx, msmtp and other tools on the VM.

### git status
What: shows which files changed and what is staged.
When: before every git add, to see exactly where I stand.

### git add .
What: stages every change in the current folder for the next commit.
When: after pwd confirms I'm inside the repo.

### git commit -m "message"
What: saves a snapshot of the staged changes locally with a message.
When: after each finished step, one small commit at a time.

### git push
What: uploads my local commits to GitHub.
When: after committing, which is what makes the green square appear.

### git log --oneline
What: lists past commits, one line each.
When: confirming my commit exists and what's on top.

### ssh
What: connects to another machine's terminal over an encrypted channel.
When: logging into my VM at 192.168.122.214 from my laptop.

### ssh-keygen -t ed25519
What: creates a public and private key pair (ed25519 is a modern, strong key type).
When: before turning off password login, so I had a key to log in with.

### ssh-copy-id
What: copies my public key into the server's ~/.ssh/authorized_keys file.
When: installing my key on the sinexiq, labadmin and labuser accounts.

### scp
What: copies files between two machines over SSH.
When: pulling system-report.sh and the Nginx config from the VM into my repo.

### chmod 600
What: lets only the file's owner read and write it.
When: locking ~/.msmtprc because it holds my Gmail app password.

### sudo adduser
What: creates a new user account with a home folder and password.
When: creating labadmin and labuser to practise least privilege.

### systemctl status
What: shows whether a service is running, plus its recent log lines.
When: checking that nginx and system-report.service were healthy.

### ufw allow
What: adds a firewall rule that permits traffic on a port.
When: allowing 22/tcp and 80/tcp before enabling UFW.

