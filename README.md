# RPMBUILD for corkscrew

## How to Build
```sh
git clone https://github.com/allanhung/rpm_corkscrew
cd rpm_corkscrew
docker run --name=corkscrew_build --rm -ti -v $(pwd)/rpms:/root/rpmbuild/RPMS/x86_64 -v $(pwd)/rpms:/root/rpmbuild/RPMS/noarch -v $(pwd)/scripts:/usr/local/src/build centos /bin/bash -c "/usr/local/src/build/build_corkscrew.sh"
```

## How to use
![alt text](https://github.com/allanhung/rpm_corkscrew/raw/master/ssh_over_https_proxy.png "ssh over proxy")

```sh
# on ssh gateway
# change ssh listen port to 443
sed -i -e "s/^Port.*/Port 443/g" /etc/ssh/sshd_config
systemctl restart sshd

# on ssh client
yum localinstall -y rpms/corkscrew-*.rpm

/etc/ssh/ssh_config
====================================================================
Host SSH_GATEWAY_EIP
    ServerAliveInterval 60
    TCPKeepAlive yes
    ProxyCommand corkscrew HTTPS_PROXY 8080 %h %p
    IdentityFile ~/MY.PEM
    StrictHostkeyChecking no
    
Host 172.*
    ServerAliveInterval 60
    TCPKeepAlive yes
    ProxyCommand ssh -i ~/MY.PEM USER@SSH_GATEWAY_EIP -p 443 nc %h %p
    StrictHostkeyChecking no
====================================================================    
```
