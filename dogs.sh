#!/bin/bash

SCALE=3

# Arguments parsing
[[ -n "$1" ]] && str="$1" || { echo "Usage: ./dogs.sh AGE_YEARS [ AGE_MONTH [ AGE_DAYS ] ]"; exit }
[[ -n "$2" ]] && str+=" + (($2) / 12)"
[[ -n "$3" ]] && str+=" + (($3) / 365)"

# Calculate years
human=$(echo "$str" | bc -l)
dog=$(printf "%.${SCALE}f" $(echo "e( ($human - 31) / 16 )" | bc -l ))


# Calculating dogs years, months and days
part=$(echo $dog | sed "s/[0-9]*\.//")

y=$(echo $dog | sed "s/\.[0-9]*//")
m=$(( (12 * $part) / 10**$SCALE ))
d=$(( (365 * $(echo $part | sed "s/0*//") / 10**$SCALE) % 30))


# Print the info
echo "In dogs calendar ur $dog years old"
echo "Or formatted.. ${y}y ${m}m ${d}d"
