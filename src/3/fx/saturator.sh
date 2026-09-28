#saturator < overdrive < distotion < fuzz
Saturator() {
	local gain=${1:-3}
	local colour=${2:-10}
	#sox -t wav - -t wav - overdrive 3 10
	sox -t wav - -t wav - overdrive $gain $colour
}
