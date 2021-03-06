![GTPB](http://gtpb.igc.gulbenkian.pt/bicourses/images/GTPB2015logo.png "GTPB")

ARANGS16
========
Shareable virtual machines and containers: vagrant and docker
-------------------------------------------------------------
*2016-05-11*

#### Structure and goals

Today we will finish with Vagrant by learning how to package our own Vagrant box
files. Once we've covered all of Vagrant we were going to cover we will do a 
recap by each making our own mind map, which we will share with each other. Then
we will transition to Docker, which is another approach to virtualization.

We hope to accomplish the following learning goals today:

- How Vagrant and packer can be used to create and share boxes
- How to create a git "pull request" to share files upstream
- How Docker builds off virtualization with a different approach
- The docker toolset: `docker`, `docker-machine`, and `docker-compose`
- Container Applications compared to Virtual Machine Images
- How to run Docker containers
- The global docker hub registry
- Volume Containers to permanently store and share data
- How to plug host directories into the file system expected by a container application

#### Packaging a Vagrant box

Yesterday we learned how to interact with vagrant boxes: we managed to configure the 
resources available to them (e.g. shared folders, the amount of RAM), specify which
OS to deploy, and provision the OS with additional tools. However, it doesn't seem 
particularly efficient to make every user of your VM run the same provisioning steps.
Again, there must be a better way to do this - and there is, by packaging a provisioned
Vagrant box ourselves. We will practice this.

#### Smaller "virtual machines": Docker containers

The approach taken by Vagrant is not particularly efficient with our compute resources, 
both in terms of storage - we have downloaded an entire OS, when actually a lot of its 
functionality already existed on our computer - and in terms of compute power and RAM 
memory: we are now running two entire operating systems side by side (the host and the guest).
For example, yesterday we ran our pipeline in a Vagrant box based on Ubuntu 14.04 LTS 
deployed on a host OS running... Ubuntu 14.04 LTS. This is 100% redundant.

A more efficient approach would be to only install the parts of the guest OS that we don't
have yet and run those, while most of the system processes are delegated to the host OS.
Due to some enhancements in the architecture of Linux operating systems this is now more
or less possible. With this approach we strictly speaking are no longer running entire
virtual machines, but "containers". This functionality is provided by `docker`, which we
will explore today.

(On other operating systems, e.g. Mac OSX, docker containers can also be used, but because
these operating systems have a different architecture, there is still a small virtual
machine running in the background so the efficiency gains aren't quite as great.)

Schedule
--------

The outline for today is as follows:

### Session 1: Building Vagrant boxes.

We are going to make our own vagrant box file to share with others. The end
result will be something [like this](https://atlas.hashicorp.com/Naturalis/boxes/arangs2015),
which you can install with `vagrant init Naturalis/arangs2015` (etc.). A box file
is [a combination of the virtual hard drive of the VM and metadata](http://docs.vagrantup.com/v2/boxes/format.html).
Do the [assignments](https://github.com/rvosa/arangs2016/blob/master/docs/2016-05-11/packer/Worksheet.md) 
in the packer folder to build a Vagrant box.

### Session 2: Recap from yesterday. 
 
Yesterday we saw how Vagrant and Puppet can automate the deployment, configuration and 
provisioning of compute environments and how to run analyses inside a VM. To capture our 
understanding of yesterday's progress, we will each make a mindmap with XMind during the 
recap. We will also share these with each other. Do the [assignments](https://github.com/rvosa/arangs2016/blob/master/docs/2016-05-11/mindmap/Worksheet.md) 
in the mind map folder to share the mind map using a "pull request". 

### Session 3: Docker introduction. 

We will now begin to look at a newer technology that has emerged within the last few years, Docker.  
In this session, we will go over the basic concepts of the Docker system, and get to know its
similarities and differences with Virtualization.  We will then learn about the docker ecosystem on 
registry.docker.hub. We will then start with the [assignments](https://github.com/rvosa/arangs2016/blob/master/docs/2016-05-11/intro_docker/Worksheet.md)
in the docker folder (and finish them after the tea break).

### Session 4: Docker Commandline.  

Given what we've seen so far we should be able to install bwa and samtools
inside a docker container. Here's an [assignment](https://github.com/rvosa/arangs2016/blob/master/docs/2016-05-11/containerize/Worksheet.md)
to exercise this.

In this part we will work with the docker commandline to
run some of the official images hosted by the Docker Hub.  In doing so, we will learn about the following important concepts:
  - a visceral feeling for how docker is different from virtualization
  - The Docker lexicon: image and container
  - The intimate relationship between the docker commandline and the hub
  - mounting locally hosted directories as docker volumes
  - exposing ports
  - managing machines, images, and containers
  
Requirements
------------

* [vagrant](https://www.vagrantup.com/downloads.html)
* [docker](https://docs.docker.com/machine/#installation)
