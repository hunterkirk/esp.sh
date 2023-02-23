#!/bin/bash

zener_card[1]="○"
zener_card[2]="+"
zener_card[3]="⋮⋮⋮"
zener_card[4]="▢"
zener_card[5]="★"

hit_count=0
miss_count=0

session_active="active"
echo "================================="
echo "|       Are you Psychic?        |"
echo "================================="
echo "|        Ctrl+C to Exit         |"
echo "================================="
while [[ $session_active != "bye" ]]; do

    echo 'Guess the symbol & press ENTER!'
    echo '○ + ⋮⋮⋮ ▢ ★'
    echo '1 2  3  4 5'

    guess_this_card=$(jot -r 1 1 5)

    read your_guess

    if [[ $your_guess == $guess_this_card ]]; then
        echo "Psychic HIT!"
        sleep .5
        let "hit_count++"

    else
        echo "Psychic MISS!"
        sleep .5
        let "miss_count++"
    fi

    clear
    echo "ESP Hits: $hit_count"
    echo "ESP Misses: $miss_count"
    accuracy="$hit_count/$miss_count"
    foo=$(bc -l <<< "scale=2; $accuracy")
    echo "ESP Accuracy: $foo" 
    echo "================================="
    
done
