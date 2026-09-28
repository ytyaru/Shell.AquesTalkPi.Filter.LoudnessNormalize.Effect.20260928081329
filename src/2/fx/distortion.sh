#$ sox --help-effect overdrive
#sox:      SoX v14.4.2
#
#Effect usage:
#
#overdrive [gain [colour]]
Distortion() {
	local gain=${1:-20}
	local colour=${2:-10}
	#sox -t wav - -t wav - overdrive 20 10
#	sox -t wav - -t wav - overdrive $gain $colour
#	sox -t wav - -t wav - compand 0.01,0.01 -90,-90,-20,-20,0,0 0 -90 0.01
#	sox -t wav - -t wav - compand 0.001,0.001 -90,-90,-10,-10,0,-10 0 -90
	sox -t wav - -b 16 -t wav - gain 40 gain -40
}
