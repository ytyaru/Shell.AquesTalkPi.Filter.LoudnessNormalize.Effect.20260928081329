#$ sox --help-effect phaser
#sox:      SoX v14.4.2
#
#Effect usage:
#
#phaser gain-in gain-out delay decay speed [ -s | -t ]
#sox -t wav - -t wav - phaser 0.6 0.66 3 0.6 0.5 -s
Phaser() {
	local gainIn=${1:-0.6}
	local gainOut=${2:-0.66}
	local delay=${3:-3}
	local decay=${4:-0.6}
	local speed=${5:-0.5}
	local type=${6:--s}
	sox -t wav - -t wav - phaser $gainIn $gainOut $delay $decay $speed $type
}
