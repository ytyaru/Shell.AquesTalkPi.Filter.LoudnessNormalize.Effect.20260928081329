#$ sox --help-effect delay
#sox:      SoX v14.4.2
#
#Effect usage:
#
#delay {position}
Delay() {
	local seconds=${1:-0.5}
	sox -t wav - -t wav - delay $seconds
#	sox -t wav - -t wav - delay $seconds $seconds
}
