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
    docker-machine create --driver virtualbox --engine-env NO_PROXY='*' docker
    docker-machine stop docker || docker-machine kill docker
    VBoxManage modifyvm "docker" --natpf1 "squid,tcp,,43128,,43128"
    ```
1. Copy [docker-at-boot.plist](osx/docker-at-boot.plist) to `/Library/LaunchDaemons/`.
1. Change the username from `user` to your admin username in `/Library/LaunchDaemons/docker-at-boot.plist`.
1. Make logs directory `/Users/user/logs`.
1. Configure launchd to run docker host at boot.
1. Reboot.
1. Install [docker](https://www.docker.com).
1. Configure docker proxies to exclude `*`. Either via GUI or by editin `/Users/user/Library/Group Containers/group.com.docker/http_proxy.json`
1. Set docker env to point to VirtualBox docker host.
    ```
    . <(docker-machine env docker)
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
1. Set proxies
    ```
    for proto in ftp web secureweb gopher; do 
        networksetup -set${proto}proxy Wi-Fi localhost 43128
        networksetup -set${proto}proxystate Wi-Fi on
    done
    ```
Note: Once this setup is running you may want to modify the whitelist. For the changes to take affect you will need to run as admin:
```
docker exec squid squid -k reconfigure
```

#### Child account
Child will have to login manually into their own account.  
Childs account needs to be setup with proxy poining to squid. Default: `localhost:3128`.  

