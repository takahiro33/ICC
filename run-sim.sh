#!/bin/bash

WAFDIR=./
WAF=${WAFDIR}waf

mkdir results/
mkdir results/graphs/
mkdir results/normal/
mkdir results/proactive/

for  speed in 0 5 10
do

mkdir results/normal/speed:$speed/
mkdir results/proactive/speed:$speed/

for distance in 50 100 200
do 

mkdir results/normal/speed:$speed/distance:$distance/
mkdir results/proactive/speed:$speed/distance:$distance/

for mobile in 1 2 5 10
do

mkdir results/normal/speed:$speed/distance:$distance/MN:$mobile
mkdir results/proactive/speed:$speed/distance:$distance/MN:$mobile

# Creat Directries for trace files
echo "run $WAF --run "icc-scenario -speed=$speed -smart -mobile=$mobile -trace""
$WAF --run "icc-scenario -speed=$speed -distance=$distance -smart -mobile=$mobile -trace" 

echo "run $WAF --run "icc-scenario -speed=$speed -smart -trace -mobile=$mobile -proactive""
$WAF --run "icc-scenario -speed=$speed -distance=$distance -smart -proactive -mobile=$mobile -trace" 

done

done

done
		
