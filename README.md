# dotFiles
useful dotFiles for my complete dev env



## Creating  a similar ubuntu machine on a clean install
Create a list of package on the older machine using : 
    sudo dpkg --get-selections | sed "s/.*deinstall//" | sed "s/install$//g" > ~/pkglist 
    awk '!($2="")' ~/pkglist >> ~/update_packager
    rm ~/pkglist

The packages listed here can be installed by the following command :
    sudo aptitude update && cat ~/update_package | xargs sudo aptitude install -y
  
