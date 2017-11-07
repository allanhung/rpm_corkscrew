RPMBUILD for corkscrew
=========================

corkscrew rpm

How to Build
=========
    git clone https://github.com/allanhung/rpm_corkscrew
    cd rpm_corkscrew
    docker run --name=corkscrew_build --rm -ti -v $(pwd)/rpms:/root/rpmbuild/RPMS/x86_64 -v $(pwd)/rpms:/root/rpmbuild/RPMS/noarch -v $(pwd)/scripts:/usr/local/src/build centos /bin/bash -c "/usr/local/src/build/build_corkscrew.sh"

# check
    docker run --name=corkscrew_check --rm -ti -v $(pwd)/rpms:/root/rpmbuild/RPMS centos /bin/bash -c "yum localinstall -y /root/rpmbuild/RPMS/corkscrew-*.rpm"
