export RPMBUILDROOT=/root/rpmbuild

yum install -y gcc rpm-build make patch wget git
mkdir -p $RPMBUILDROOT/SOURCES && mkdir -p $RPMBUILDROOT/SPECS && mkdir -p $RPMBUILDROOT/SRPMS
# fix rpm marcos
sed -i -e "s#.centos##g" /etc/rpm/macros.dist

# get rpm
wget http://rpmfind.net/linux/fedora/linux/development/rawhide/Everything/source/tree/Packages/c/corkscrew-2.0-22.fc27.src.rpm
rpm -i corkscrew-*.src.rpm

# compile corkscrew
rpmbuild -bb $RPMBUILDROOT/SPECS/corkscrew.spec
