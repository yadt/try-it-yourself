# WIP

# Try it yourself ...

* it's easy to start and stop services on clients.
* install operating system updates on multiple machines
* Reboot client after kernelupdates

![concept yadtshell and yadtminion](https://raw.github.com/yadt/try-it-yourself/master/images/yadtshell_to_yadtclient.png)

In this guide we want to show you how to set up a minimal YADT system, on two host with real world services to play with.

## Prerequisites
* a RHEL based system version 6.x (preferred).
* python >= 2.6.
* a user with sufficient rights to install/remove packages via `sudo yum`.
* All hosts to be controlled are accessible passwordless via ssh.
* EPEL has to be installed. You will find the rpm on [The newest version of 'epel-release' for EL6](http://download.fedoraproject.org/pub/epel/6/i386/repoview/epel-release.html), for example


## Checkout the files
/etc/yum.repos.d/yadt.repo
```
[yadt]
name=yadt repo
baseurl=http://dl.bintray.com/yadt/rpm
gpgcheck=0
```
## Installation

### Password-less ssh on local machine
```bash
# keep the .ssh path but set the passphrase as you like
ssh-keygen
# copy the id_rsa.pub key to the authorized_key file in your .ssh folder (home directory)
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
```



