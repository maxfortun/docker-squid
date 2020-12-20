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
    docker-machine stop docker || docker-machine kill docker
    VBoxManage modifyvm "docker" --natpf1 "squid,tcp,,3128,,43128"
    ```
1. Copy [docker-at-boot.plist](osx/docker-at-boot.plist) to `/Library/LaunchDaemons/`.
1. Change the username from `user` to your admin username in `/Library/LaunchDaemons/docker-at-boot.plist`.
1. Make logs directory `/Users/user/logs`.
1. Configure launchd to run docker host at boot.
1. Reboot.
1. Install [docker](https://www.docker.com).
1. Set docker env to point to VirtualBox docker host.
    ```
    eval "$(docker-machine env docker)"
    ```
1. Clone this repo.
    ```
    git clone https://github.com/maxfortun/docker-squid.git
    ```
1. Review or modify [whitelisted domains](mnt/etc/squid/conf.d/kids/whitelist). 
1. Run squid.
    ```
    bin/run.sh
    ```

#### Child account
Child will have to login manually into their own account.  
Childs account needs to be setup with proxy poining to squid. Default: `localhost:3128`.  

