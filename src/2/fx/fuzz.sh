Fuzz() {
	local gain=${1:-15}
	local colour=${2:-30}
	#sox -t wav - -t wav - overdrive 20 10
#	sox -t wav - -t wav - overdrive $gain $colour
	sox -t wav - -t wav - highpass 200 overdrive 100 100 lowpass 4000 gain -3
}
