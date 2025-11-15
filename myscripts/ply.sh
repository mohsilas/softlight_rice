#!/bin/bash

# Get a list of all available players
players=$(playerctl --list-all 2>/dev/null)

found_playing=false

for player in $players; do
    status=$(playerctl -p "$player" status 2>/dev/null)
    
    if [[ "$status" == "Playing" ]]; then
        # Get the metadata title
        title=$(playerctl -p "$player" metadata title 2>/dev/null)
        
        # Initialize a prefix
        prefix=""

        # Determine the prefix based on the player name and specific title for Firefox
        case "$player" in
            "spotify")
                prefix=" "
                ;;
            firefox.*)
                title=" Firefox" 
                ;;
            *) # Default case for any other player
                ;;
        esac

        # If a title exists, print it with the prefix
        if [[ -n "$title" ]]; then
            echo "${prefix}${title}"
            found_playing=true
            # If you only want the title from the *first* playing player, uncomment the next line:
            # break 
		else
			echo "  $player"
            found_playing=true
        fi
    fi
done

if ! $found_playing; then
    # Optional: print a message if no player is currently playing or no title found
    # echo "No song playing or title unavailable" 
	echo "󰥠"
    #exit 1 # Exit with a non-zero status if nothing is playing
fi
