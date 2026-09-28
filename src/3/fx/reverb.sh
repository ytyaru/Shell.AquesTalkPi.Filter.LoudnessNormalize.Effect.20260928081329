#$ sox --help-effect reverb
#sox:      SoX v14.4.2
#
#Effect usage:
#
#reverb [-w|--wet-only] [reverberance (50%) [HF-damping (50%) [room-scale (100%) [stereo-depth (100%) [pre-delay (0ms) [wet-gain (0dB)]]]]]]
Reverb() {
	local erance=${1:-50}
	local damping=${2:-50}
	local roomScale=${3:-100}
	local stereoDepth=${4:-100}
	local preDelay=${5:0}
#	sox -t wav - -t wav - reverb 50 50 100 100 0 0
	sox -t wav - -t wav - reverb $erance $damping $roomScale $stereoDepth $preDelay
}
