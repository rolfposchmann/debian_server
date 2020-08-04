https://medium.com/@jasonrigden/hardening-ssh-1bcb99cd4cef
https://blog.buettner.xyz/sichere-ssh-konfiguration/

Port 2222

Protocol 2

HostKey /etc/ssh/ssh_host_ed25519_key
HostKey /etc/ssh/ssh_host_rsa_key

#Root Login erlauben?
PermitRootLogin yes

#Only this user can login via SSH
AllowUsers rolf

#X11 für grafische Oberfläche
X11Forwarding no

PasswordAuthentication no

#höher als PAM
ChallengeResponseAuthentication no

#PAM does not just do authentication, but authorisation and session services. You probably want to keep it on as it adds quite a bit of flexibility.
# https://serverfault.com/questions/669458/whats-the-downside-of-disabling-pam-in-openssh-if-only-public-key-login-is-allo
UsePAM yes


Test:
sshd -t
sudo systemctl reload sshd


apt-get install fail2ban
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
------
[sshd]enabled  = true
port    = ssh
logpath = %(sshd_log)s
------
service fail2ban restart


#google auth
sudo apt-get install libpam-google-authenticator
google-authenticator
Do you want authentication tokens to be time-based YES
and yes,yes,yes
nano /etc/pam.d/sshd
auth required pam_google_authenticator.so

sshd_config:
UsePAM yes

ChallengeResponseAuthentication yes
