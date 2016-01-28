# -*- coding: utf-8 -*-
# Team Brinkman
# Luc van Zandbrink & Willem Kamerman
# City walkingtour
# 25/01/2016
# Get the coordinates of the list of adress queries.

import requests
import csv
import time
from GoogleCoordinatestoCSV import get_longlat
from GoogleCoordinatestoCSV import search_coor_for_csv
                                 
## Input and Output file
# make sure the input file row is comma seperated like; "Description, address, cityname".                                 
in_csvfile = '/home/user/Desktop/workspace/week4/data/examplequerylist.csv'
out_csvfile = '/home/user/Desktop/workspace/week4/data/DescCoords.csv'

search_coor_for_csv(in_csvfile, out_csvfile)