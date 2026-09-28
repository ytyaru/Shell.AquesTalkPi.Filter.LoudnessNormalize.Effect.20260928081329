#$ sox --help-effect tremolo
#sox:      SoX v14.4.2
#
#Effect usage:
#
#tremolo speed_Hz [depth_percent]
#sox -t wav - -t wav - tremolo 5 40
# speed_Hz: 変調周波数（スピード。1秒間に何回音量を揺らすか、単位はHz）
# depth_percent: 変調奥行き（深さ。音量をどれくらい下げるか、単位は%）
Tremolo() {
	local speedHz=${1:-5}
	local depthPercent=${2:-40}
#	local speedHz=${1:-8}
#	local depthPercent=${2:-100}
#	local speedHz=${1:-1.5}
#	local depthPercent=${2:-30}
#	local speedHz=${1:-12}
#	local depthPercent=${2:-60}
	sox -t wav - -t wav - tremolo $speedHz $depthPercent
}
