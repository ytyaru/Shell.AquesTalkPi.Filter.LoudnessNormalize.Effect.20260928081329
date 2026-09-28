#$ sox --help-effect synth
#sox:      SoX v14.4.2
#
#Effect usage:
#
#synth [-j KEY] [-n] [length [offset [phase [p1 [p2 [p3]]]]]]] {type [combine] [[%]freq[k][:|+|/|-[%]freq2[k]] [offset [phase [p1 [p2 [p3]]]]]]}
Vibrato() {
	local speedHz=${1:-5}
	local depthPercent=${2:-40}
	sox -t wav - -t wav - synth sine fmod $speedHz $depthPercent
}
