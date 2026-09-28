#sudo apt update
#sudo apt install sox libsox-fmt-all swh-plugins
#sudo apt install sox ladspa-sdk autotalent

# $1: low/hi/kero: 犯罪者(低音/高音)/Perfume風ケロケロ音
Vocoder() {
	local mode=${1:-kero}
#	eval "$(VocoderCommand $mode)"
	sox -t wav - -t wav - $(getParam $mode)
}
# $1: low/hi/kero: 犯罪者(低音/高音)/Perfume風ケロケロ音
getParam() {
	case $1 in
		low)  echo 'pitch -800 synth sine fmod 90 lowpass 1000 vol 2.5';;
		hi)   echo 'pitch 700 synth sine fmod 180 highpass 300 vol 1.5';;
#		*)    echo 'ladspa '"$(dpkg -L autotalent | grep autotalent.so)"' autotalent 440 0 0 0 -1.1 0 0 -1.1 0 -1.1 0 0 -1.1 0 -1.1 1 0 0 0 0 5 0 0 0 0 0 1 0 0 0';;
#		*)    echo 'ladspa '"$(dpkg -L autotalent | grep autotalent.so)"' autotalent 440 0 0 0 -1.1 0 0 -1.1 0 -1.1 0 0 -1.1 0 -1.1 1 0 0 0 0 5 0 0 0 0 0 1 0 0 0';;
		* )   echo 'ladspa /usr/lib/ladspa/autotalent.so autotalent 440 0 0 0 -1.1 0 0 -1.1 0 -1.1 0 0 -1.1 -1.1 -1.1 1 0 0 0 0 5 0 0 0 0 0 1 0 0 0';;
#		* )   echo 'ladspa /usr/lib/ladspa/autotalent.so autotalent 440 0 0 0 -1.1 0 -1.1 0 -1.1 0 -1.1 0 -1.1 0 -1.1 1 0 0 0 0 5 0 0 0 0 0 1 0 0 0';;
	esac
}
# $1: low/hi/kero: 犯罪者(低音/高音)/Perfume風ケロケロ音
VocoderCommand() {
	case $1
		low)  echo 'sox -t wav - -t wav - pitch -800 synth sine fmod 90 lowpass 1000 vol 2.5'
		hi)   echo 'sox -t wav - -t wav - pitch 700 synth sine fmod 180 highpass 300 vol 1.5'
		*)    echo 'sox -t wav - -t wav - ladspa '"$(dpkg -L autotalent | grep autotalent.so)"' autotalent 440 0 0 0 -1.1 0 0 -1.1 0 -1.1 0 0 -1.1 0 -1.1 1 0 0 0 0 5 0 0 0 0 0 1 0 0 0'
	esac
}
