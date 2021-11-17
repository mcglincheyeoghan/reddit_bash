#!/bin/bash

input="reddit_lower_nopunct.csv"
num_cols=$(head -1 $input | sed 's/[^,]//g' | wc -c)

for((col=1;col<=num_cols;col++))
do
	tail -n +2 $input | while IFS= read -r var
	do
		header=$(head -1 $input | cut -d, -f$col)
		rows=`echo $var | cut -d, -f$col`
		mongo reddit --eval 'db.redditCollection.insert({'"$header"': "'"$rows"'"})'
	done
done
