#!/usr/bin/env bash
# File: guessinggame.sh

# Get and store the number of files in the current dir 
num_files=$(ls -latr | egrep "^-" | wc -l)

# Function to evaluate a user guess.
# Returns 0 if correct, 1 if too high and 2 if too low.
function check_guess {
    local result

    if [[ $num_files -lt $1 ]]
    then
        result=1
    elif [[ $num_files -gt $1 ]]
    then
        result=2
    fi

    if [[ $num_files -eq $1 ]]
    then
        result=0
    fi

    echo $result
}


# infinite loop - breaks if i is set equal to 1
for ((i=2; i>1; i++));
do
    echo "How many files are in the current directory?"
    read user_guess
    echo "You guessed $user_guess"

    i=$(check_guess $user_guess)
    [[ $i -eq 1 ]] && echo "too high"
    [[ $i -eq 2 ]] && echo "too low"
    [[ $i -eq 0 ]] && echo "correct. Congrats"
done
