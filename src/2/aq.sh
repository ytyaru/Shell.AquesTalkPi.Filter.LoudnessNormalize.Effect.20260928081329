HERE="$(dirname "${BASH_SOURCE:-0}")"; 
cd "$HERE"
. fx/reverb.sh
. fx/delay.sh
. fx/chorus.sh
. fx/echo.sh
#. fx/fade.sh
. fx/fade-in.sh
. fx/fade-out.sh
AQ=/home/pi/root/sys/env/tool/aquestalkpi/1.20/AquesTalkPi
AQ_TXT='アクエストークパイで音声合成のテストをします。'
AQ_OPT='-v f2'
# サンプリングレート 44100=44.1KHz
RATE=44100
# 音質改善イコライザ(-v f1|f2)
aq_filters() {
	# -v f1
	LOWPASS_FREQ="3500"
	EQ_PARAM="equalizer 2000 0.5h 5"
	# -v f2
	if [[ " $str " =~ [[:space:]]f2[[:space:]] ]]; then
		LOWPASS_FREQ="3200"
		EQ_PARAM="equalizer 1700 0.5h 3"
	fi
	sox -t wav - -t wav -r $RATE - gain -3 rate -v $RATE lowpass $LOWPASS_FREQ $EQ_PARAM
}
# 音量統一（ラウドネス正規化）
# $1: I: -14〜-16。LUFS。音量。
# $2: TP: -1.0〜1.5。0で音割れする確率が高いため下げる。
# $3: LRA: 7〜11（11はTVで言葉の抑揚を含める範囲値）
loudness_normalize() {
	local I=${1:--14}
	local TP=${2:--1.0}
	local LRA=${3:-11}
	PARAM="loudnorm=I=${I}:TP=${TP}:LRA=${LRA}"
	ffmpeg -i pipe:0 -af $PARAM -ar $RATE -f wav pipe:1
}
# $AQ_OPTにクォートは付けないこと（スペース区切りを有効化するため）
#"$AQ" $AQ_OPT "$AQ_TXT" | aq_filters "$AQ_OPT" | loudness_normalize | aplay
#"$AQ" $AQ_OPT "$AQ_TXT" | aq_filters "$AQ_OPT" | reverb | loudness_normalize | aplay
#"$AQ" $AQ_OPT "$AQ_TXT" | aq_filters "$AQ_OPT" | delay 0.9 | loudness_normalize | aplay
#"$AQ" $AQ_OPT "$AQ_TXT" | aq_filters "$AQ_OPT" | chorus | loudness_normalize | aplay
#"$AQ" $AQ_OPT "$AQ_TXT" | aq_filters "$AQ_OPT" | Echo | loudness_normalize | aplay
#"$AQ" $AQ_OPT "$AQ_TXT" | aq_filters "$AQ_OPT" | Fade | loudness_normalize | aplay
"$AQ" $AQ_OPT "$AQ_TXT" | aq_filters "$AQ_OPT" | FadeIn | FadeOut | loudness_normalize | aplay

#WAV_Base64=$(aquestalkpi "$AQ" $AQ_OPT "$AQ_TXT" | base64)
#WAV=$("$AQ" $AQ_OPT "$AQ_TXT")
#echo -n "$WAV" | base64 -d | aq_filters "$AQ_OPT" | loudness_normalize | aplay


