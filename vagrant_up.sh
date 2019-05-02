# Run Vagrant at my office
function vg-u() {
	dirA=".vagrant/machines_office"
	dirB=".vagrant/machines_home"
	dirC=".vagrant/machines"

	if [ -d $dirA ]
	then
		if [ -d $dirC ]
		then
		    mv $dirC $dirB
		fi
		mv $dirA $dirC
	fi
	vagrant up
}
