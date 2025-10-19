#!/bin/bash

# Define the list of Pokémon names
POKEMON_LIST="Bulbasaur Ivysaur Venusaur Charmander Charmeleon"
BASE_URL="https://pokeapi.co/api/v2/pokemon/"

# Loop through each Pokémon in the list
for POKEMON in $POKEMON_LIST; do
    
    # 1. Convert the name to lowercase for the API URL
    # 'tr' is a great text processing utility for this!
    LOWER_POKEMON=$(echo "$POKEMON" | tr '[:upper:]' '[:lower:]')

    # 2. Construct the full URL and execute curl, saving output to a unique file
    echo "Fetching data for $POKEMON..."
    curl -s "$BASE_URL$LOWER_POKEMON" > "$POKEMON.json"

    # 3. IMPLEMENT RATE LIMITING: Pause for 1 second to avoid rate-limiting/overloading the API
    sleep 1 
done

echo "Batch retrieval complete. Check the generated .json files."
