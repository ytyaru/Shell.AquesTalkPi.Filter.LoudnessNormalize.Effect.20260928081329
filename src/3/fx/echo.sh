#$ sox --help-effect echo
#sox:      SoX v14.4.2
#
#Effect usage:
#
#echo gain-in gain-out delay decay [ delay decay ... ]
Echo() {
	local gainIn=${1:-0.8}
	local gainOut=${1:-0.88}
	local delay=${1:-60}
	local decay=${1:-0.6}
#	sox -t wav - -t wav - echo $gainIn $gainOut $delay $decay
	# 二回響かせる場合、delayとdecayの組合せを後ろに続けて記述する
#	sox -t wav - -t wav - echo $gainIn $gainOut $delay $decay 120 0.2
#	sox -t wav - -t wav - echo $gainIn $gainOut $delay $decay 120 0.4 180 0.2
	# 山彦
#	sox -t wav - -t wav - echo 0.8 0.9 500 0.5
	sox -t wav - -t wav - echo 0.8 0.9 400 0.4 800 0.2 1200 0.1
	# カラオケ
#	sox -t wav - -t wav - echo 0.8 0.85 150 0.4 300 0.2
	# 風呂場・トンネル
#	sox -t wav - -t wav - echo 0.8 0.9 30 0.6 60 0.4 90 0.3
	# ロボット風
#	sox -t wav - -t wav - echo 0.8 0.8 5 0.9 10 0.8 15 0.7
}
