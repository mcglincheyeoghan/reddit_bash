#!/bin/bash
cp reddit_months.csv reddit_lower_nopunct.csv

input="reddit_lower_nopunct.csv"
while IFS= read -r var
do
	title=`echo $var | cut -d, -f37`
	title_lower=$(echo $title | tr [:upper:] [:lower:])
	title_rm_punct=$(echo $title_lower | tr -d [:punct:])
	sed -i "s+$title+$title_rm_punct+" reddit_lower_nopunct.csv
done < "$input"
