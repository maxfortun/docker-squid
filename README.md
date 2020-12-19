# docker-squid

Runs squid proxy in Docker.  

## Safe browsing for kids.  
I am compiling an [ACL](mnt/etc/squid/conf.d/kids/whitelist) that I believe is safe for my kids.  
You can turn it `on`/`off` in [local.conf](mnt/etc/squid/conf.d/local.conf)  

### Windows
I don't do Windows, so can't help you here. PRs welcome.  

### Mac
Mac is a bit tricky, as Docker runs within the user space and only on login.   
You will need at least 2 acconuts. 1 admin account and 1+ child account. 

#### Admin account
1. Install [VirtualBox](https://www.virtualbox.org).
1. Install [docker-machine](https://docs.docker.com/machine/install-machine/).
1. Create VirtualBox docker host.
    ```
    docker-machine create --driver virtualbox docker
    ```
1. Configure docker host to start at boot.

#### Child account
Child will have to login manually into their own account.  
Childs account needs to be setup with proxy poining to squid. Default: `localhost:3128`.  

