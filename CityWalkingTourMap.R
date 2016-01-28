## packages
library(rgdal)
library(sp)
library(maptools)
library(car)
library(maps)
library(raster)
library(latticeExtra)
library(OpenStreetMap)
library(mapview)
library(leaflet)

# info about data
## osm download url: http://download.geofabrik.de/europe/netherlands.html
## administrative borders download: http://www.gadm.org/
## Rijksmonumenten download: cultureelerfgoed.nl/node/1385

# set workdirectory
setwd("E:\\Studie\\2015-2016-P3-GRS-33806\\data\\final") #Windows example

# load function
source("Rscript\\DrawMap.R")

## data
roads <- readShapeLines("output\\munroads.shp")
contour <- readShapePoly("output\\mun.shp")
poi <- readShapePoints("data\\Rijksmonumenten\\RCE_Rijksmonumenten_point.shp")
poi2 <- read.csv("data\\poi\\DescCoords.csv")

# Call function
DrawMap(roads, contour, poi, poi2)