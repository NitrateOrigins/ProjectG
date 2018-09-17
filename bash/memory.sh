#!/bin/bash

number=0
last=0
title="You'll Remember This"
ver=0.5.1.0

startup() {
        clear
        echo "Welcome to \""$title"\" [v"$ver"]!"
        echo "Please, enter your first name below and last name; without spaces."
        echo "Example: if your real name is John Smith, input this: \"JohnSmith\""
        read -p "First Name: " name
        echo "-- "$name" --" >> $name".sav"
        age
}

age() {
        clear
        echo "Please, type in your age."
        echo "This is used to determine our results."
        read -p "My age: " age
        echo "Age: "$age >> $name".sav"
        gender
}

gender() {
        clear
        echo "Now, please type your gender."
        echo "Type 'm' for male and 'f' for female."
        read -p "My gender: " gender
        if [ $gender = "m" ] || [ $gender = "f" ] || [ $gender = "male" ] || [ $gender = "female" ] || [ $gender = "M" ] || [ $gender = "F" ] || [ $gender = "Male" ] || [ $gender = "Female" ]; then
                if [ $gender = "m" ] || [ $gender = "male" ] || [ $gender = "M" ] || [ $gender = "Male" ]; then
                        gender="Male"
                        echo "Gender: "$gender >> $name".sav"
                        enteringGame
                else
                        gender="Female"
                        echo "Gender: "$gender >> $name".sav"
                        enteringGame
                fi
        else
                echo "That is not one of the options..."
                read -p "Hit 'enter' to return..."
                gender
        fi
        clear
        echo "If you see this message, either you tampered with the code or the game glitched..."
        read -p "Either way, please tell the operator. Thanks!" q
        exit
}

enteringGame() {
        clear
        echo "You are about to play a memory game."
        echo ""
#       echo "-- How to Play --"
        echo "Ask the operators for instructions on how to play."
#       echo "You will be given a sequence of numbers. Your task is to remember"
#       echo "as much of the sequence as possible. For instance: if you are on"
#       echo "the third round, and round one's number is 1 and round two's"
#       echo "number is 2, and you were just told that round three's number"
#       echo "is 3; you will input this sequence: \"123\" into the blank."
        echo ""
        echo "If you have any questions, ask the people testing you."
        echo ""
        read -p "Hit 'enter' when ready..." q
        selectNext
}

selectNext() {
        next=$RANDOM
        range=9
        let "next %= $range"
        tellNext
}

tellNext() {
        clear
        echo "Next Number: "$next
        read -p "Ready? Hit 'enter' to continue..." q
        saveThis
}

saveThis() {
        ram=RAM.sav
        let "number += 1"
        now=$number
        let "now -= 1"
        source RAM.sav
        echo "num"$number"="$next >> $name".sav"
        if [ -f $ram ]; then
                sed -i '$ d' $ram
                echo "\""${wholenum[$last]}$next"\"" >> $ram
                echo ")" >> $ram
                let "last += 1"
        else
                echo "wholenum=(" >> $ram
                echo "\""$next"\"" >> $ram
                echo ")" >> $ram
        fi
        guessLoop
}

guessLoop() {
        source $ram
                clear
        echo "Try to remember the whole sequence in order. You are on level "$number"."
        read -p "The current sequence is: " choice
        if [ $choice = ${wholenum[$now]} ]; then
                echo "Correct!"
                read -p "Press 'enter' to continue..." q
                echo "> Correct: "${wholenum[$now]} >> $name".sav"
        else
                oops
        fi
        selectNext
}

oops() {
        echo "Incorrect!"
        echo "You have gotten to level: "$number
        echo ""
        echo "Did you accidentally hit the wrong key or another issue happened?"
        read -p "Type 'yes' or 'no': " oops
        if [ $oops = "yes" ] || [ $oops = "Yes" ] || [ $oops = "y" ]; then
                echo "Your answer has been reset..."
                read -p "Press 'enter' to go back to the last sequence you were on..."
                guessLoop
        elif [ $oops = "no" ] || [ $oops = "No" ] || [ $oops = "n" ]; then
                clear
                echo "You have gotten to level: "$number
                echo "Correct answer: "${wholenum[$now]}
                read -p "Press 'enter' to save..." q
                echo "> Incorrect! They put: "$choice" | Correct answer: "${wholenum[$now]} >> $name".sav"
                almostDone
        else
                echo ""
                echo "Invalid input!"
                echo "That was not one of the options..."
                read -p "Press 'enter' to retry..."
                oops
        fi
}

almostDone() {
        f=Subjects.sav
        correct=$number
        let "correct -= 1"
        if [ -f $f ]; then
                source $f
                let "subjectnumber += 1"
                sed -i '1s/.*/subjectnumber='$subjectnumber'/' $f
                echo "Subject: "$subjectnumber" -- Age: "$age" -- Gender: "$gender" -- Name: "$name >> $f
                echo "Stats > Level: "$number" -- Correct: "$correct >> $f
        else
                subjectnumber=1
                echo "subjectnumber=0" >> $f
                sed -i '1s/.*/subjectnumber='$subjectnumber'/' $f
                echo "Subject: "$subjectnumber" -- Age: "$age" -- Gender: "$gender" -- Name: "$name >> $f
                echo "Stats > Level: "$number" -- Correct: "$correct >> $f
        fi
        rm Correct\:
        rm Level\:
        rm RAM.sav
        aboutDone
}

aboutDone() {
        clear
        echo "You have finished the test! \o/ <-- Guy cheering. I think."
        echo "Please tell the operators (the people who gave you this test)"
        echo "that you have finished. Thanks for testing!"
        read -p "If you messed up on accident, tell them so."
        aboutDone
}

startup
