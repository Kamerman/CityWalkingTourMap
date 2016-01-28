# Function to draw a map with:
# *Roads, coloured red to green for attractivity
# *Contour of the municipality
# *Monument locations with info (poi)
# *Your own points of interest (poi2)

DrawMap <- function(roads, contour, poi, poi2){
## adjust projections
prj_string_WGS <- CRS("+proj=longlat +datum=WGS84")
roads@proj4string@projargs <- "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
contour@proj4string@projargs <- "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
poi@proj4string@projargs <- "+proj=sterea +lat_0=52.15616055555555 +lon_0=5.38763888888889 +k=0.9999079 +x_0=155000 +y_0=463000 +ellps=bessel +units=m +no_defs"

## select wageningen monuments
poi <- subset(poi, poi@data$GEMEENTE=='Wageningen')

## roads
roads@data$RoadAttractivity = roads@data$type
roads@data$RoadAttractivity <- recode(roads@data$RoadAttractivity, 
																			"'abandoned'=3;
																			'access'=2;
																			'acces_ramp'=2;
																			'bridleway'=2;
																			'bus_guideway'=1;
																			'bus_stop'=1 ;
																			'construction'=1;
																			'corridor'=3;
																			'crane'=2;
																			'cycleway'=7;
																			'dismantled'=2;
																			'disused'=2;
																			'elevator'=2;
																			'escalator'=5;
																			'footway'=9;
																			'living_street'=6;
																			'motorway'=1;
																			'motorway_link'=1;
																			'no'=1;
																			'path'=9;
																			'pedestrian'=8;
																			'planned'=1;
																			'platform'=4;
																			'primary'=1;
																			'primary_link'=1;
																			'proposed'=3;
																			'raceway'=1;
																			'ramp'=1;
																			'residential'=6;
																			'rest_area'=8;
																			'road'=3;
																			'secondary'=3;
																			'secondary_link'=3;
																			'service'=2;
																			'services'=2;
																			'steps'=8;
																			'tertiary'=7;
																			'tertiary_link'=7;
																			'track'=8;
																			'trail'=5;
																			'trunk'=1;
																			'trunk_link'=1;
																			'unclassified'=5;
																			'unsurfaced'=3;
																			'virtual'=2;
																			'yes'=1")

## Coordinates for extra points using the python script: getcoordinatesAdressQuery.py, if you want to add more points
prj_string_WGS <- CRS("+proj=longlat +datum=WGS84")
poi2.1 <- SpatialPointsDataFrame(poi2[,2:3], poi2, proj4string=prj_string_WGS)

## Adjust files for mapView
poi1 <- spTransform(poi, CRS=CRS("+init=epsg:28992"))
roads2 <- spTransform(roads, CRS=CRS("+init=epsg:28992"))
contour3 <- spTransform(contour, CRS=CRS("+init=epsg:28992"))
poi2.2 <- spTransform(poi2.1, CRS=CRS("+init=epsg:28992"))

## Plot files in mapView
m1 <- mapView(poi1, col="blue")
m2 <- mapView(roads2[9], burst=TRUE, color = c("Red","Green4"), legend=TRUE, legend.opacity = 100)
m3 <- mapView(contour3, color = "white")
m4 <- mapView(poi2.2, col="yellow")
m3 + m2 + m4 + m1
}