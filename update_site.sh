#!/bin/bash


#check if correct number of arguments
if  [ $# != 1 ]
then
	echo "Improper arguments ./update_site.sh directory" 
	exit 1
fi

#cd into directory
cd $1

#move forge settings
mv forge/settings.py ../settings.py

#update git
git pull

#move forge settings back
mv ../settings.py forge/settings.py

#update django database
python3 manage.py makemigrations
python3 manage.py migrate

