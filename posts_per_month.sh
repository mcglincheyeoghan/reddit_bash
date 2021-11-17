#!/bin/bash

cut -d, -f8 reddit_months.csv | tail -n +2 | sort | uniq -c
