#!/bin/bash

# turns state file into a simplified geojson file

# usage (from project root): 
#  bash scripts/make_state_labels.sh

# make a point layer, attach labels to them, also class and IDs
npx mapshaper -i geos/us_states_albers.json \
    -points inner \
    -style label-text=STUSPS \
    -style class="g-state-name" \
    -each 'ID_BUILDER=`g-state-${STUSPS}`' \
    -o id-field=ID_BUILDER geos/us_states_albers_labels_postal.json
    
# same, but with full state names
npx mapshaper -i geos/us_states_albers.json \
    -points inner \
    -style label-text=NAME \
    -style class="g-state-name" \
    -each 'ID_BUILDER=`g-state-${STUSPS}`' \
    -o id-field=ID_BUILDER geos/us_states_albers_labels_fullnames.json
    
# same, but with NYT state names
npx mapshaper -i geos/us_states_albers.json \
    -join data/us_states_metadata.csv keys=STUSPS,postal \
    -points inner \
    -style label-text=nyt_name \
    -style class="g-state-name" \
    -each 'ID_BUILDER=`g-state-${STUSPS}`' \
    -o id-field=ID_BUILDER geos/us_states_albers_labels_nyt.json