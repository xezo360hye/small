#!/bin/bash
(
SCALE=3

[[ -n "$1" ]] && str="$1" || exit
[[ -n "$2" ]] && str+=" + (($2) / 12)"
[[ -n "$3" ]] && str+=" + (($3) / 365)"

human=$(echo "$str" | bc -l)
dog=$(printf "%.${SCALE}f" $(echo "e( ($human - 31) / 16 )" | bc -l ))

#echo "HUMAN = $str = $human"
#echo "DOG = e^((HUMAN - 31) / 16) = $dog"

#y=${dog%.*}
y=$(echo $dog | sed "s/\.[0-9]*//")

part=$(echo $dog | sed "s/[0-9]*\.//")
m=$(( (12 * $part) / 10**$SCALE ))
d=$(( (365 * $(echo $part | sed "s/0*//") / 10**$SCALE) % 30))

echo "In dogs calendar ur $dog years old"
echo "Or formatted.. ${y}y ${m}m ${d}d"
)
