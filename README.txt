# CityWalkingTourMap

Read me

Brinkman
Luc van Zandbrink & Willem Kamerman
28-01-2016

Be aware that the scripts are written for Windows, except the python scripts:
	- GetCoordinatesFromAddressQueries.py
	- GoogleCoordinatestoCSV.py

To make a City Walking Tour follow the following steps:
1. Download the proper data in your own data directory:
	- GADM: http://www.gadm.org/
	- OpenStreetMap: http://download.geofabrik.de/europe/netherlands.html
	- Rijksmonumenten: cultureelerfgoed.nl/node/1385
2. If you want you make a csv file with other points of interest (poi) like the one in Pythonscript\\data\\examplequerylist.csv.
	- If you use the python script to retrieve coordinates from googleapi with the addresses keep the following in mind:
		- The fact that Google set maximum request quota and rate limit for the API services per IP address.*
		- The free daily quota is 100,000 per 24 hours.
		- The rate limit is 50 requests per second.
		- It takes GoogleCoordinatestoCSV.py per query 1 second to stay within the Google limits.
3. Open the arcpy script to select and clip the right municipality with its roads.
	- pay attention to your working directory and data directory.
4. Open the R script to create the maps
	- pay attention to your working directory and data directory.
5. View your map 

*In case you do reach your daily quota (IndexError) on your IP address you can check this just by copy-pasting the url of
the API from the script in your browser and add a query instead of {}. If the limit is reached, google gives the following error:

{
   "error_message" : "You have exceeded your daily request quota for this API. We recommend registering for a key at the Google Developers Console: https://console.developers.google.com/",
   "results" : [],
   "status" : "OVER_QUERY_LIMIT"
}
