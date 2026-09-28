#$ sox --help-effect fade
#sox:      SoX v14.4.2
#
#Effect usage:
#
#fade [ type ] fade-in-length [ stop-position [ fade-out-length ] ]
#       Time is in hh:mm:ss.frac format.
#       Fade type one of q, h, t, l or p.
FadeIn() {
#	local audio_data=$(cat)
	local type=${1:-t}
	local length=${2:-2}
	sox -t wav - -t wav - fade $type $length
}

