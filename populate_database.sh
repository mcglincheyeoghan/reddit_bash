#!/bin/bash

input="reddit_lower_nopunct.csv"
tail -n +2 $input | while IFS= read -r var
do
	author_id=`echo $var | cut -d, -f5`
	author=`echo $var | cut -d, -f2`
	author_cakeday=`echo $var | cut -d, -f3`
	mysql -h localhost -u "root" --password="" -e "insert into reddit.user values('$author_id', '$author', '$author_cakeday')"

	subreddit=`echo $var | cut -d, -f31`
	mysql -h localhost -u "root" --password="" -e "insert into reddit.subreddit values('$subreddit')"

	id=`echo $var | cut -d, -f16`
	created_month=`echo $var | cut -d, -f8`
	title=`echo $var | cut -d, -f37`
	mysql -h localhost -u "root" --password="" -e "insert into reddit.post values('$id', '$author_id', '$subreddit', '$created_month', '$title')"
done
