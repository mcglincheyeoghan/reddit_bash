#!/bin/bash

col_count=$(head -1 reddit_clean2.csv | sed 's/[^,]//g' | wc -c)
cp reddit_clean2.csv reddit_clean3.csv
for ((col=col_count; col>0; col--));
do
	uninformative=true
	cp reddit_clean3.csv reddit_clean2.csv
	uniq_count=$(cut -d, -f"$col" reddit_clean2.csv | tail -n +2 | sort | uniq | wc -l)
		if [ $uniq_count != 1 ];
		then
			uninformative=false
		fi

		if [ "$uninformative" == true ];
		then
			cut -d, -f"$col" --complement reddit_clean2.csv>reddit_clean3.csv
		fi

	echo Uninformative: $uninformative
done
