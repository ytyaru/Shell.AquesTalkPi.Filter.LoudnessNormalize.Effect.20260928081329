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
		low)  echo 'gain -1 equalizer 2200 1.5q +8 gain -8 pitch -600 compand 0.005,0.1 -60,-60,-40,-20,-10,-5 0 -20';;
		hi)   echo 'gain -1 equalizer 2200 1.5q +6 gain -6 pitch +600 gain -6 compand 0.005,0.1 -60,-60,-40,-20,-10,-5 0 -20';;
#		low)  echo 'pitch -800 synth sine fmod 90 lowpass 1000 vol 2.5';;
#		hi)   echo 'pitch 700 synth sine fmod 180 highpass 300 vol 1.5';;
		* )   echo 'ladspa '"$(dpkg -L autotalent | grep autotalent.so)"' autotalent 440 0 0 0 -1.1 0 0 -1.1 0 -1.1 0 0 -1.1 -1.1 -1.1 1 0 0 0 0 5 0 0 0 0 0 1 0 0 0';;


#		*)    echo 'ladspa '"$(dpkg -L autotalent | grep autotalent.so)"' autotalent 440 0 0 0 -1.1 0 0 -1.1 0 -1.1 0 0 -1.1 0 -1.1 1 0 0 0 0 5 0 0 0 0 0 1 0 0 0';;
#		*)    echo 'ladspa '"$(dpkg -L autotalent | grep autotalent.so)"' autotalent 440 0 0 0 -1.1 0 0 -1.1 0 -1.1 0 0 -1.1 0 -1.1 1 0 0 0 0 5 0 0 0 0 0 1 0 0 0';;
		#* )   echo 'ladspa /usr/lib/ladspa/autotalent.so autotalent 440 0 0 0 -1.1 0 0 -1.1 0 -1.1 0 0 -1.1 -1.1 -1.1 1 0 0 0 0 5 0 0 0 0 0 1 0 0 0';;
#		* )   echo 'ladspa /usr/lib/ladspa/autotalent.so autotalent 440 0 0 0 -1.1 0 -1.1 0 -1.1 0 -1.1 0 -1.1 0 -1.1 1 0 0 0 0 5 0 0 0 0 0 1 0 0 0';;
#		whisper) ffmpeg -i pipe:0 -filter_complex "afftfilt=real='hypot(re,im)*cos((random(0)*2-1)*2*3.14)':imag='hypot(re,im)*sin((random(1)*2-1)*2*3.14)':win_size=128:overlap=0.8" -f wav pipe:1;;
		# ffmpeg -i pipe:0 -filter_complex "afftfilt=real='hypot(re,im)*cos((random(0)*2-1)*2*3.14)':imag='hypot(re,im)*sin((random(1)*2-1)*2*3.14)':win_size=128:overlap=0.8" -f wav pipe:1
		# sox -t wav - -t wav - highpass 300 mcompand "0.005,0.01 -60,-60,-40,-40,-20,-20,0,0" echo 0.8 0.8 5 0.5 10 0.3
	esac
}

