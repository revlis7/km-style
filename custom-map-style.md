# Creating a custom map style

## Step 1

Generate skeleton from default "OSM Bright" style

```
# cd /usr/local/share/maps/style/osm-bright-master/
# vi configure.py
```

```
config["name"] = "New Style"
```

```
# ./make.py
# mv ../NewStyle/project.mml ../NewStyle/project-local.mml

# vi configure.py
```

```
config["postgis"]["host"]     = "db_host"
config["postgis"]["port"]     = "db_port"
config["postgis"]["dbname"]   = "gis"
config["postgis"]["user"]     = "db_user"
config["postgis"]["password"] = "db_pass"
```

```
# ./make.py
# mv ../NewStyle/project.mml ../NewStyle/project-remote.mml

# cd ../NewStyle/
# vi .gitignore
```

```
shp
.thumb.png
project.mml
```

Add all the files to git, commit & push

## Step 2

Download and install [TileMill](https://tilemill-project.github.io/tilemill/)

Copy/clone the "NewStyle" directory to the TileMill project directory

Create symlink so TileMill can find a project.mml file

```
ln -s project-remote.mml project.mml
```

Edit project.mml to set a reasonable "Center" lat/lon

```
  "center": [
    0,
    20,
    4
  ],
```

Launch TileMill

### Fix errors

Close any errors that pop up when you open the new project in TileMill

Click the layers button, remove:

* land-high.shp
* land-low.shp
* ne_places

Click "Save" (top right), go back to Projects, then back into this new project

*Be patient*

First time loading will be very slow, and the next times too, until you add some indexes

For indexes, look in extras/ directory, also [this wiki entry](http://wiki.openstreetmap.org/wiki/User:Species/PostGIS_Tuning) has ideas/directions

Re-add land-high and land-low layers directly in project.mml - use the shapes from Natural Earth (see "get-shapes.sh")

```
"Layer": [
    {
      "geometry": "polygon",
      "extent": [
        -180,
        -85.051,
        180,
        83.59960937500006
      ],
      "id": "land-low",
      "class": "",
      "Datasource": {
        "file": "shp\\ne_50m_admin_0_countries\\ne_50m_admin_0_countries.shp",
        "type": "shape"
      },
      "srs-name": "WGS84",
      "srs": "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs",
      "advanced": {},
      "name": "land-low"
    },
    {
      "geometry": "polygon",
      "extent": [
        -179.9999999999999,
        -85.051,
        180,
        83.63410065300012
      ],
      "id": "land-high",
      "class": "",
      "Datasource": {
        "file": "shp\\ne_10m_admin_0_countries\\ne_10m_admin_0_countries.shp",
        "type": "shape"
      },
      "srs-name": "WGS84",
      "srs": "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs",
      "advanced": {},
      "name": "land-high"
    },
```

### Tips

Work one layer at a time - hide the others

Explore the data with the data browser in TileMill (in the Layers popup)

Remember to check your paths in *both* project-*mml files

Have fun!