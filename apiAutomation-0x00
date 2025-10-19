#!/bin/bash

# 1. Execute curl command and save output to data.json
curl -s https://pokeapi.co/api/v2/pokemon/pikachu > data.json

# 2. Check the exit code ($?) of the previous command (curl)
if [ $? -ne 0 ]; then
    # 3. If the exit code is non-zero (failed), log the error to errors.txt
    echo "Curl failed to connect or had a network error." >> errors.txt
    # (Optional, but good practice: clean up the incomplete data file)
    rm -f data.json
else
    # Optional success message
    echo "Pikachu data successfully retrieved and saved to data.json."
fi

