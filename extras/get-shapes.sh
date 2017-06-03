#!/bin/bash -e

# http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/ne_10m_admin_0_countries.zip

if [ ! -d 'shp/ne_10m_admin_0_countries' ]; then
  wget http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/ne_10m_admin_0_countries.zip
  unzip ne_10m_admin_0_countries.zip
  mkdir -p shp/ne_10m_admin_0_countries
  rm ne_10m_admin_0_countries.zip
  mv ne_10m_admin_0_countries.* shp/ne_10m_admin_0_countries/
fi

# http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/cultural/ne_50m_admin_0_countries.zip

if [ ! -d 'shp/ne_50m_admin_0_countries' ]; then
  wget http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/cultural/ne_50m_admin_0_countries.zip
  unzip ne_50m_admin_0_countries.zip
  mkdir -p shp/ne_50m_admin_0_countries
  rm ne_50m_admin_0_countries.zip
  mv ne_50m_admin_0_countries.* shp/ne_50m_admin_0_countries/
fi

echo <<EOF
Kaufmich shapes installed.
EOF

