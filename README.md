# try it yourself ...

[YADT - an Augmented Deployment Tool](http://www.yadt-project.org/)

* It's easy to start and stop services on clients
* Install operating system updates on multiple machines
* Reboot client after kernel updates

![concept yadtshell and yadtminion](https://raw.githubusercontent.com/yadt/try-it-yourself/master/images/yadtshell_to_yadtminion.png)

In this guide we want to show you how to set up a minimal YADT system, on two
hosts with real world services to play with.  The ```yadtshell``` on the first
server is the "remote control", the ```yadt-minion``` is the client component.

## prerequisites

* Two RHEL based system version 6.x or 7.x
* Python >= 2.6
* A user with sufficient rights to:
    * Install/remove packages via ```sudo yum```
    * Start and stop services via ```sudo service ...```
* All hosts to be controlled are accessible **passwordless** via ssh from the
  yadtshell server
* EPEL has to be installed. You will find the rpm on [The newest version of
  'epel-release' for
  EL6](http://download.fedoraproject.org/pub/epel/6/i386/repoview/epel-release.html),
  for example


## install the rpms

this adds our repository to your RHEL based system: (yum-config-manager is part of ```yum-utils```)
```
sudo yum-config-manager --add-repo https://raw.githubusercontent.com/yadt/try-it-yourself/master/yadt.repo
```
or this on RedHat 7 machines:
```
sudo yum-config-manager --add-repo https://raw.githubusercontent.com/yadt/try-it-yourself/master/yadt-7.repo
```

let's have a look into the file:

```bash
cat /etc/yum.repos.d/yadt.repo
```
```bash
[yadt]
name=yadt repo
baseurl=http://dl.bintray.com/yadt/rpm
gpgcheck=0
```
check the repository with:
```bash
$ sudo yum repolist
```

you will see something like this:
```bash
...
extras                      CentOS-6 - Extras       14
updates                     CentOS-6 - Updates      1.104
yadt                        yadt repo               4
repolist: 18.467
```

## installation

Now you can use ```yum``` to install the yadt components on your servers

on the "master" server:

```[vagrant@yadtshell-testmachine ~]$ sudo yum install yadtshell```

on the client server:

```[vagrant@minion-testmachine ~]$ sudo yum install yadt-minion```


## configuration of the yadt-minion

### tl;dr

save this snipplet as ```/etc/yadt.conf.d/10_postfix.yaml``` (4 **blanks** no
**tabs**)

```yaml
services:
    postfix:
```

Please check if the postfix process is up and running on minion side. ```sudo
service postfix status```.  You can use any process you want but avoid using
the ```sshd``` process :-) .

### long version

The yadt-minion gets conﬁgured via ```*.yaml``` ﬁles in the
```/etc/yadt.conf.d/``` directory; they get merged in alphanumeric
order. Please note Indented blocks have to start with **4 blanks**.

The yadt-minion rpm provides its default configuration as
```00_defaults.yaml```.  Please check the
[wiki](https://github.com/yadt/yadtshell/wiki/Host-Configuration) or
[cheatsheet](http://www.yadt-project.org/cheatsheet/cheatsheet.pdf) for further
information about service configuration.


## configuration of the yadtshell

You can run ```yadtshell``` commands on _targets_, a _target_ is a set of hosts
which belong together. Check the
[wiki](https://github.com/yadt/yadtshell/wiki/Target) or the
[cheatsheet](http://www.yadt-project.org/cheatsheet/cheatsheet.pdf) for further
information.

save this snipplet as a file named ```target``` (e.g in your home folder)

```yaml
hosts:
- minion-testmachine
```
please note "minion-testmachine" ist the hostname of the minion server.

## using the yadtshell

change your directory to the folder with the target file and enter
```
init-yadtshell
```

you will see something like this:

```
starting yadt session

yadt | home      target hosts: *unknown, call status first*
```

### yadtshell status

now call ```status```

![yadtshell_status](https://raw.githubusercontent.com/yadt/try-it-yourself/master/images/yadtshell_status.png)

### yadtshell service start/stop

Now try to start and stop your service on the machine, please check the
[wiki](https://github.com/yadt/yadtshell/wiki/Services) and the
[cheatsheet](http://www.yadt-project.org/cheatsheet/cheatsheet.pdf) for further
commands and usefull information.

```stop service://minion-testmachine/postfix```

```start service://minion-testmachine/postfix```

### yadtshell update

As you can see we found an update of postfix, we can update the machine by
calling ```update```.
![yadtshell_status](https://raw.githubusercontent.com/yadt/try-it-yourself/master/images/yadtshell_status_with_update.png)

### YADT Project

[yadt-minion on github](https://github.com/yadt/yadt-minion)

[yadtshell on github](https://github.com/yadt/yadtshell)

[follow us on twitter](https://twitter.com/YadtProject)

[YADT - an Augmented Deployment Tool](http://www.yadt-project.org/)

### Overview of all YADT Components

![overview of all yadt components](https://cdn.rawgit.com/yadt/try-it-yourself/master/images/overview.svg)
