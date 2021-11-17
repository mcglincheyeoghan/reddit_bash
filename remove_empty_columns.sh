#!/bin/bash

col_count=$(head -1 reddit_clean.csv | sed 's/[^,]//g' | wc -c)
cp reddit_clean.csv reddit_clean2.csv
for ((col=col_count; col>0; col--))
do
	empty_col=true
	cp reddit_clean2.csv reddit_clean.csv
	for line in $(tail -n +2 reddit_clean.csv | cut -d, -f"$col")
	do
		if [ ! -z "$line" ]
		then
			empty_col=false
			break
		fi
	done

	if [ "$empty_col" == true ]
	then
		cut -d, -f"$col" --complement reddit_clean.csv>reddit_clean2.csv
	fi
done
