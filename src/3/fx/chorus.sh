#$ sox --help-effect chorus
#sox:      SoX v14.4.2
#
#Effect usage:
#
#chorus gain-in gain-out delay decay speed depth [ -s | -t ]
# gain-in: 入力音量の調整（音割れ防止に少し下げます）
# gain-out: 出力音量の調整
# delay: 遅延時間（ミリ秒）。コーラス感に影響します。
# decay: 遅延音の減衰率。
# speed: モジュレーション（揺れ）の速度（Hz）
# depth: モジュレーションの深さ（ミリ秒）
# -s: モジュレーションの波形（-s は正弦波、-t は三角波）
# -t: モジュレーションの波形（-s は正弦波、-t は三角波）
# 後半の「60 0.32 0.4 2.3 -t」は2個目のコーラス。同様に好きなだけ追加できる。
Chorus() {
	sox -t wav - -t wav - chorus 0.7 0.9 55 0.4 0.25 2 -t 60 0.32 0.4 2.3 -t
#	local gainIn=${1:-0.7}
#	local gainOut=${2:-0.9}
#	local delayMs=${3:-55}
#	local decay=${4:-0.4}
#	local speed=${5:-0.25}
#	local depth=${6:-2}
#	local form=${7:--t}
#	sox -t wav - -t wav - chorus 0.7 0.9 55 0.4 0.25 2 -t 60 0.32 0.4 2.3 -t
#	sox -t wav - -t wav - chorus  $form
}
chorusParam() {
	local gainIn=${1:-0.7}
	local gainOut=${2:-0.9}
	local delayMs=${3:-55}
	local decay=${4:-0.4}
	local speed=${5:-0.25}
	local depth=${6:-2}
	local form=${7:--t}
	echo "$gainIn $gainOut $delayMs $decay $speed $depth $form"
}
