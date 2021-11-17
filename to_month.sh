#!/bin/bash
head -n 1000 reddit_clean3.csv > reddit_months.csv
input="reddit_months.csv"

tail -n +2 $input | while IFS= read -r var
do
	created=`echo $var | cut -d, -f8`
	created_month=$(date --date='@'$created +%B)
	sed -i "s/$created/$created_month/" reddit_months.csv

	retrieved=`echo $var | cut -d, -f27`
	retrieved_month=$(date --date='@'$retrieved +%B)
	sed -i "s/$retrieved/$retrieved_month/" reddit_months.csv
done
