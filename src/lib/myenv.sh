#!/bin/bash
##########################################
# File not intended to be ran standalone #
##########################################

##
# So... (( )) works in bash 4 and 3, so we can use that even if we aren't using
# new bash in MacOSX
##

__detect_distro() {
	# Find out which distro we are on...

	DISTRO='unknown'
	BASE='unknown'

	lsb_release=$(which lsb_release 2> /dev/null)
	if [ "X${lsb_release}" != "X" ]; then
		DISTRO=$(lsb_release -si)
		[ "${DISTRO}" == "Fedora" ] && BASE="RH"
		[ "${DISTRO}" == "Ubuntu" ] && BASE="Debian"
		DISTREL=$(lsb_release -sr)
		[ "${DISTRO}" == "Ubuntu" ] && DISTREL=$(echo ${DISTREL} | awk -F. '{ print $1 }')
	elif [ -r "/etc/redhat-release" ]; then
    	BASE="RH"
    	$(grep -q CentOS /etc/redhat-release) && DISTRO='CentOS'
    	$(grep -q Fedora /etc/redhat-release) && DISTRO='Fedora'
    	$(grep -q "Red Hat" /etc/redhat-release) && DISTRO='RHEL'
	elif [ "$(uname)" == "Darwin" ]; then
    	DISTRO="OSX"
    	BASE="BSD"
    	DISTREL=$(sw_vers -productVersion)
	fi
	export BASE DISTRO DISTREL
}