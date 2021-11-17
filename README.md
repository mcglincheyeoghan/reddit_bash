# reddit_bash
This was the first assignment I did as part of the Programming for Big Data module. In this assignment, I cleaned the 
reddit_20212.csv file using Bash by removing empty and uninformative columns, converting columns from UTC to months, 
creating new columns and removing stop words and punctuation from the dataset. I then used SQL inside the bash terminal
to create the database, populate it and then analyse it using various SQL commands. In order to run the SH files, you
will need to install Docker. 
If you wish to run these programs, go to cmd and navigate to the file in which the SH files are stored,
then write
docker cp <programName.sh> dockerid
Once you have done that, in order to view the file you'll need to write
nano <programName.sh>
To execute the file, firstly write
chmod u+x <programName.sh>
Then write
./<programName.sh>
