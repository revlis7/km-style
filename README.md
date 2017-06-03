# Welcome

This repository contains the "Kaufmich Light" map style

See [here](custom-map-style) for instructions to create a custom map style, from a template (OSM Bright)

## Getting started

Ensure you have a working tile server before starting

## Get everything needed

Run these commands on the frontend server

```
# cd /usr/local/share/maps/style
# rm master.zip
# wget https://github.com/tomedme/km-style/archive/master.zip
# unzip master.zip
# cd km-style-master
# chmod +x extras/*.sh
# ./extras/get-shapes.sh
```

Retrieve & load the full data into the database

* you may need to edit the bounding box in get-full-data.sh
* the import will take a long time (12 hours or more) - use screen!

```
# cd extras/
# ./get-full-data.sh
# mv europe-merged.osm.pbf ~/tile-server-master/
# cd ~/tile-server-master/
# ./3_load-data.sh europe-merged.osm.pbf
```

After the data is fully imported, create the indexes

```
# cd /usr/local/share/maps/style/km-style-master/extras/
# sudo -u postgres psql -d gis < indexes.sql
```

## Compile the stylesheet

If the database and frontend are on the same server, use "project-local.mml", otherwise edit the database connection settings in "project-remote.mml"

```
# carto project-{local|remote}.mml > kaufmich.xml
```

Update /usr/local/etc/renderd.cnf - add this section at the bottom:

```
[kaufmich]
URI=/km_tiles/
TILEDIR=/var/lib/mod_tile
XML=/usr/local/share/maps/style/km-style-master/kaufmich.xml
HOST=localhost
TILESIZE=256
```

Restart renderd

```
# /etc/init.d/renderd restart
```

Use the render.php script to generate the tile numbers for render.sh

* you can get the coordinates from the OpenStreetMap "Export" functionality
* change the "N" parameter to the number of cores you have access to

```
# cd /usr/local/share/maps/style/km-style-master/extras/
# php render.php 8.2102,47.2750,8.8570,47.5274
```

## Render all the tiles needed

Add the output from render.php into render.sh, then run the script

* this will take some time (a few hours or more) - use screen!

```
# ./render.sh
```

## Final steps

Once rendering has finished, you need to convert the metatiles to png images

```
# cd ~/
# rm master.zip
# wget https://github.com/tomedme/meta2tile/archive/master.zip
# unzip meta2tile-master.zip
# cd meta2tile-master/
# make
```

Create the directory that will contain the png files

```
# cd ~/
# mkdir tiles
```

Convert the metatiles

```
# ~/meta2tile-master/meta2tile /var/lib/mod_tile/kaufmich ~/tiles
```

Final step is to transfer the png files to the image store on the cluster