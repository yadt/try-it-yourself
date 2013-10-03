# Try it yourself ...

... using the yadtshell it's easy to start and stop services on yadtclients.

![concept yadtshell and yadtclient](https://raw.github.com/yadt/try-it-yourself/master/images/yadtshell_to_yadtclient.png)

In this guide we want to show you how to set up a minimal YADT system, on a single host with dummy services to play with.

## Prerequisites
* We recommend to test YADT in a vm.
* red hat system version 6.x (preferred).
* python >= 2.6.
* yum, rpm and a user with sufficient rights to install/remove packages via `sudo yum`.
* All hosts to be controlled are accessible passwordless via ssh.
* EPEL has to be installed. You will find the rpm on [The newest version of 'epel-release' for EL6](http://download.fedoraproject.org/pub/epel/6/i386/repoview/epel-release.html), for example

```bash
sudo yum localinstall http://ftp.tu-chemnitz.de/pub/linux/fedora-epel/6/i386/epel-release-6-8.noarch.rpm
```

* git to clone the repository

```bash
sudo yum install git
```

## Checkout the files

Clone the try-it-yourself repository:

```bash
git clone https://github.com/yadt/try-it-yourself
```

## Installation

### Password-less ssh on local machine
```bash
# keep the .ssh path but set the passphrase as you like
ssh-keygen
# copy the id_rsa.pub key to the authorized_key file in your .ssh folder (home directory)
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
```

### Execute setup scripts

```bash
cd try-it-yourself

( cd yadtclient; ./setup.sh )

( cd yadtshell; ./setup.sh )
```

The `yum` installation runs will ask you if you want to proceed:
review the actions yum will take and type `yes` when appropriate.


## "Hello World"

```bash
cd yadtshell
./helloworld.sh
```

This script will

1. create a simple target definition file in a new subfolder adequately named "helloworld",
2. define the local host as member of the new target (using its [fqdn](http://en.wikipedia.org/wiki/Fully_qualified_domain_name)),
3. update the target and start all services,
4. try to fetch the current [status information](https://github.com/yadt/yadtshell/wiki/Status-Information) of the target via `yadtshell status`

![yadtshell status](https://raw.github.com/yadt/try-it-yourself/master/images/yadtshell_status.png)

For more commands, check out the cheat sheet from the [project page](http://www.yadt-project.org) or the [wiki](https://github.com/yadt/yadtshell/wiki).

## Deinstallation
To remove all yadt related rpms, run `./cleanup.sh` in both the yadtclient and yadtshell folder.
