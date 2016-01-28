# -*- coding: utf-8 -*-

## Function written by the guys from Nelen&Schuurmans to get the latlon by a Google Maps API query.

import requests

def get_longlat(query):
    """Get longitude and latitude form Google api for a place
    
    Args:
        query (str): place to geocode
        
    Returns:
        location in lonlat
    """
    result = requests.get("http://maps.googleapis.com/maps/api/geocode/json?address={}".format(query))
    coordinates = result.json()['results'][0]['geometry']['location']
    return coordinates

## Function to make a csv file of addresses with coordinates of monumental buildings in the Netherlands.
    
import csv
import time
                                 
def search_coor_for_csv(in_csvfile, out_csvfile):
    """Get coordinates of the address queries in the list.
    
    Input:
        A csv file for each row written as: "discription, address, cityname"
    
    Args:
        in_csvfile: inputpath
        out_csvfile: outputpath
    
    Output:
        A csv file with the descriptions and coordinates.
    """
    with open(in_csvfile, 'r') as csvinputfile:
        with open(out_csvfile, 'w') as csvoutputfile:
            reader = csv.reader(csvinputfile)
            writer = csv.writer(csvoutputfile)
            writer.writerow(['Description','lon','lat']) # write the headers.
            for row in reader: # get the long and lat values of the addresses and write it to the new csv file.
                time.sleep(1) #Do not exceed the rate limit of 50 requests per second for our friends from Google
                address = str(row[1])+' '+str(row[2])
                print str(row[0])                
                coordinates = get_longlat(address)
                print coordinates
                writer.writerow([str(row[0]),str(coordinates['lng']), str(coordinates['lat'])])
