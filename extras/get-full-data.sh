#!/bin/bash -e

wget http://download.geofabrik.de/europe-latest.osm.pbf

osmconvert europe-latest.osm.pbf --out-o5m -o=europe-latest.osm.o5m
osmconvert europe-latest.osm.o5m -b=3.120,45.737,17.358,55.078 --complete-ways -o=europe-cropped.osm.o5m
rm europe-latest.osm.pbf europe-latest.osm.o5m
osmfilter europe-cropped.osm.o5m --keep-tags="all highway= waterway= water= railway= natural=water" --out-o5m -o=europe-filtered.osm.o5m
rm europe-cropped.osm.o5m

wget http://download.geofabrik.de/europe/switzerland-latest.osm.pbf
osmconvert switzerland-latest.osm.pbf --out-o5m -o=switzerland-latest.osm.o5m
rm switzerland-latest.osm.pbf

wget http://download.geofabrik.de/europe/austria-latest.osm.pbf
osmconvert austria-latest.osm.pbf --out-o5m -o=austria-latest.osm.o5m
rm austria-latest.osm.pbf

wget http://download.geofabrik.de/europe/netherlands-latest.osm.pbf
osmconvert netherlands-latest.osm.pbf --out-o5m -o=netherlands-latest.osm.o5m
rm netherlands-latest.osm.pbf

wget http://download.geofabrik.de/europe/germany-latest.osm.pbf
osmconvert germany-latest.osm.pbf --out-o5m -o=germany-latest.osm.o5m
rm germany-latest.osm.pbf

osmconvert europe-filtered.osm.o5m switzerland-latest.osm.o5m austria-latest.osm.o5m netherlands-latest.osm.o5m germany-latest.osm.o5m --out-pbf -o=europe-merged.osm.pbf

rm europe-filtered.osm.o5m switzerland-latest.osm.o5m austria-latest.osm.o5m netherlands-latest.osm.o5m germany-latest.osm.o5m
