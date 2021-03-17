#!/bin/bash

# turns state file into a simplified geojson file

# usage (from project root): 
#  bash scripts/make_state_innerlines.sh

# reproject and simplify the file
npx mapshaper -i geos/us_states_albers.json \
    -innerlines \
    -o geos/us_states_albers_innerlines.json
    
