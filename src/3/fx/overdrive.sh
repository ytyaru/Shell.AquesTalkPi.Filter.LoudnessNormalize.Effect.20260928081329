#$ sox --help-effect overdrive
#sox:      SoX v14.4.2
#
#Effect usage:
#
#overdrive [gain [colour]]
OverDrive() {
	local gain=${1:-20}
	local colour=${2:-20}
	#sox -t wav - -t wav - overdrive 20 10
	sox -t wav - -t wav - overdrive $gain $colour
}
