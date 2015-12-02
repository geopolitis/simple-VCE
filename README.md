#Simple environment 
=========================

Creating 3 instances 2x application servers 1x nginx reverse proxy.
Nginx load balancing with round-robin algorithm 50% per VM. 
Provisioning instances to VirtualBox with vagrant and configuring with chef-zero.
Building also the GO application.

Test kitchen environment has been configured and using Vagrant and serverspec to test the environment.


Prerequisities
==============

1. Install [VirtualBox](https://www.virtualbox.org/)
2. Install [Vagrant](https://www.vagrantup.com/)
3. Install [ChefDK](https://downloads.chef.io/chef-dk/)

Free 1.5GB RAM


###How to launch the environment :


###First option
============
1. Clone the repo.
 
2. run **vagrant up app1 app2 web**

3. when it finish open a browser **http://10.0.0.10**

###Second option
==============
1. Clone the repo

2. **cd chef/cookbooks/go** 

3. **kitchen test**


 if evrything executed succesffuly then


4. **kitchen create**

5. **kitchen converge**


Then repeate the same procedure on the nginx coockbook


2. **cd chef/cookbooks/nginx**

3. **kitchen test**

4. **kitchen create**

5. **kitchen converge**


The environemt is ready open on your browser **http://10.0.0.10**



###Third option  
===============

If you already have installed chef you can use the cookbooks (go and nginx).
Provided Roles and nodes files.




