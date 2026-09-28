#$ sox --help-effect fade
#sox:      SoX v14.4.2
#
#Effect usage:
#
#fade [ type ] fade-in-length [ stop-position [ fade-out-length ] ]
#       Time is in hh:mm:ss.frac format.
#       Fade type one of q, h, t, l or p.
Fade() {
#	local audio_data=$(cat)
	local type=${1:-t}
	local fadeInLength=${2:-0:05}
#	local length=${3:-0}
#	local length=${3:-$(calcWavTime "$audio_data" 44100)}
#	local length=$(tee >(soxi -d - >&2))
	local length=$(tee >(soxi -D <(cat) >&2) >/dev/null)
	#local fadeOutLength=${4:-1:85}
	local fadeOutLength=${4:-1.5}
#	sox -t wav - -t wav - fade t 0:05 0 0:05
	sox -t wav - -t wav - fade $type $fadeInLength $length $fadeOutLength
#	sox -t wav - -t wav - fade $type $fadeInLength $length $fadeOutLength
#	sox <(cat) -t wav - fade $type $fadeInLength $length $fadeOutLength
}
calcWavTime() {
	# 1. 前のコマンドからの標準入力を、一度変数（メモリ）にすべて溜め込む
	#local audio_data=$(cat)
	local audio_data="$1"
	local rate=${2:-44100}

	# 2. バイト数を取得
	local bytes=$(echo -n "$audio_data" | wc -c)

	# 3. AquesTalkPiの仕様（16bit、モノラル、16kHz = 1秒間に32,000バイト）から長さを計算
	# WAVヘッダ分の44バイトを引いて計算
	local duration=$(echo "scale=3; ($bytes - 44) / $rate" | bc)
	echo "$duration"
	# 4. SoXでフェードをかけ、そのまま「次のコマンド」の標準入力に流す
#	echo -n "$audio_data" | sox -t wav - -t wav - fade 0 $duration 1 | 次のコマンド
}
