#!/bin/bash

WAFDIR=./
WAF=${WAFDIR}waf

mkdir results/
mkdir results/graphs/

for  speed in 0 5 10
do

for distance in 50 100 200
do 

# Creat Directries for trace files
mkdir results/normal/
mkdir results/normal/$speed/
mkdir results/normal/$speed/$distance/

echo "run $WAF --run "icc-scenario -speed=$speed -smart -trace""
$WAF --run "icc-scenario -speed=$speed -distance=$distance -smart -trace" 

mkdir results/proactive/
mkdir results/proactive/$speed/
mkdir results/proactive/$speed/$distance/

echo "run $WAF --run "icc-scenario -speed=$speed -smart -trace -proactive""
$WAF --run "icc-scenario -speed=$speed -distance=$distance -smart -proactive -trace " 

done

done
		
