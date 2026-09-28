#$ sox --help-effect flanger
#sox:      SoX v14.4.2
#
#Effect usage:
#
#flanger [delay depth regen width speed shape phase interp]
#                  .
#                 /|regen
#                / |
#            +--(  |------------+
#            |   \ |            |   .
#           _V_   \|  _______   |   |\ width   ___
#          |   |   ' |       |  |   | \       |   |
#      +-->| + |---->| DELAY |--+-->|  )----->|   |
#      |   |___|     |_______|      | /       |   |
#      |           delay : depth    |/        |   |
#  In  |                 : interp   '         |   | Out
#  --->+               __:__                  | + |--->
#      |              |     |speed            |   |
#      |              |  ~  |shape            |   |
#      |              |_____|phase            |   |
#      +------------------------------------->|   |
#                                             |___|
#       RANGE DEFAULT DESCRIPTION
#delay   0 30    0    base delay in milliseconds
#depth   0 10    2    added swept delay in milliseconds
#regen -95 +95   0    percentage regeneration (delayed signal feedback)
#width   0 100   71   percentage of delayed signal mixed with original
#speed  0.1 10  0.5   sweeps per second (Hz) 
#shape    --    sin   swept wave shape: sine|triangle
#phase   0 100   25   swept wave percentage phase-shift for multi-channel
#                     (e.g. stereo) flange; 0 = 100 = same phase on each channel
#interp   --    lin   delay-line interpolation: linear|quadratic
Flanger() {
	local delay=${1:-0}
	local depth=${2:-2}
	local regen=${3:-0}
	local width=${4:-71}
	local speed=${4:-0.5}
	local shape=${4:-sine}
	local phase=${4:-25}
	sox -t wav - -t wav - flanger $delay $depth $regen $width $speed $shape $phase
}

