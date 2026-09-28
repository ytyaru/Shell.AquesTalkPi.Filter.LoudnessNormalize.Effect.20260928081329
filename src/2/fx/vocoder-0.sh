#sudo apt update
#sudo apt install sox libsox-fmt-all swh-plugins
#sudo apt install sox ladspa-sdk autotalent
Vocoder() {
	local gain=${1:-3}
	local colour=${2:-10}
	#sox -t wav - -t wav - overdrive 3 10
#	sox -t wav - -t wav - overdrive $gain $colour
	# 標準入力(-)から受け取り、ボコーダーをかけて、標準出力(-)へWAVで出す（2 channel 要求するからモノラルだと使えない）
#	sox -t wav - -t wav - ladspa -n vocoder 4
#	sox -t wav - -t wav - synth overdrive amod 400 overdrive 10 flanger
	sox -t wav - -t wav - pitch -700 synth sine fmod 120 lowpass 1500 vol 2.0 | aplay



	# 犯罪者（低音）
#	"$AQ" $AQ_OPT "$AQ_TXT" | sox -t wav - -t wav - pitch -800 synth sine fmod 90 lowpass 1000 vol 2.5 | aplay

	# 犯罪者（高音）
#	"$AQ" $AQ_OPT "$AQ_TXT" | sox -t wav - -t wav - pitch 700 synth sine fmod 180 highpass 300 vol 1.5 | aplay

	# ケロケロボイス（Perfume）
#	"$AQ" $AQ_OPT "$AQ_TXT" | sox -t wav - -t wav - ladspa /usr/lib/ladspa/autotalent.so autotalent 440 0 0 0 -1.1 0 0 -1.1 0 -1.1 0 0 -1.1 0 -1.1 1 0 0 0 0 5 0 0 0 0 0 1 0 0 0 | aplay

#	"$AQ" $AQ_OPT "$AQ_TXT" | sox -t wav - -t wav - ladspa "$(dpkg -L autotalent | grep autotalent.so)" autotalent 440 0 0 0 -1.1 0 0 -1.1 0 -1.1 0 0 -1.1 0 -1.1 1 0 0 0 0 5 0 0 0 0 0 1 0 0 0 | aplay
}
