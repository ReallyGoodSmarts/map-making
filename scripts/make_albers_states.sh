#!/bin/bash

# turns state file into a simplified geojson file

# usage (from project root): 
#  bash scripts/make_albers_states.sh

# deflate original census file
unzip -o original-geos/cb_2018_us_state_500k.zip -d tmp

# reproject and simplify the file
npx mapshaper -i tmp/cb_2018_us_state_500k.shp \
    -proj albersusa \
    -simplify resolution=1200 \
    -o geos/us_states_albers.json
    
    
npx mapshaper -i tmp/cb_2018_us_state_500k.shp \
    -proj wgs84 \
    -simplify resolution=1200 \
    -o geos/us_states.topojson
    
# clean up the tmp folder
rm tmp/*.*

