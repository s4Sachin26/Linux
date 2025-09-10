#!/bin/bash

if grep -i 'ubuntu' /etc/os-release >/dev/null
then
	PACKAGE_MANAGER=apt
fi

if grep -i 'red hat' /etc/os-release >/dev/null
then
	PACKAGE_MANAGER=dnf
fi

if [ -z $1 ]
then
	echo Enter the package you want to install :
	read PACKAGE 
else
	PACKAGE=$1
fi

echo Your Package Manager is ${PACKAGE_MANAGER} and the package you want to install is : ${PACKAGE}

echo Installation is Starting Now

#Command for installing the desired package 

sudo ${PACKAGE_MANAGER} install ${PACKAGE} -y 

