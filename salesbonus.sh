#!/bin/bash
#salesbonus.sh
##########################################################################################Starting the Script#######################################################################################################
##########################################################################################    Sales Bonus    #######################################################################################################
  


##################################

echo "Please Insert the number of people you desire to add : " # Ask user to insert the 
#number of people he desires to add!

read peopleNumber # read from keyobard

while [[ !($peopleNumber =~ ^[0-9]+$) ]]; # error handling accepting only integer
do
echo "Please insert an integer number only"

read peopleNumber
done


for (( i=0; i<peopleNumber; i++))


do

				#
############################################################################


echo "Insert the name of the employee :" #Ask user to insert the 
#name of each person !

read name[$i] 


while [[ !(${name[$i]} =~ ^[A-Za-z]+$) ]] # error handling (accepting only characters)
do
echo "Please insert a valid name"

read name[$i]
done

			#
	###########################################



#Inserting the salary per person in 4 months
echo "Insert the salary of the employee:" #Ask user to insert the 
#name of each person !


read  quarterlysales[$i]

while [[ !(${quarterlysales[$i]} =~ ^[0-9]+\.?[0-9]*$) ]]
do
echo "Please insert a valid Number"

read quarterlysales[$i]
done


if [ ${quarterlysales[$i]} -ge 1000000   ]
then

    echo "Bonus =£1,500"

else

if [ ${quarterlysales[$i]} -ge 100000  ] && [ ${quarterlysales[$i]} -le 999999 ]
then
    echo "Bonus =£750"

else

if   [ ${quarterlysales[$i]} -le 99999  ]
then
    echo "No Bonus"

    fi

     fi

  fi
done


#########################################################




S3='Please enter your choice: '
options=("Print Data without Sorting"  "Store data  by salary" "Sorting data by name" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Print Data without Sorting")
            echo "Data without sorting are :"
for ((s=0; s<peopleNumber; s++))

do
   echo ""
   echo ${name[$s]}":"${quarterlysales[$s]}    # or do whatever with individual element of the array
   echo ""
done

echo "Press ENTER button to select an option from the menu ! "
        ;;    
       
############################################################################

 "Store data  by salary")
            
# Sorting the Employees Based on their sales
for (( i = 0; i < $peopleNumber ; i++ ))
do
##########
for (( j = $i; j < $peopleNumber; j++ ))
do
##########
if [[ ${quarterlysales[$i]} -gt ${quarterlysales[$j]}  ]]; then
t=${quarterlysales[$i]}
quarterlysales[$i]=${quarterlysales[$j]}
quarterlysales[$j]=$t
buffer=${name[$i]}
name[$i]=${name[$j]}
name[$j]=$buffer
fi
done
done
# Printing the sorted number
echo -e "\nSorted Numbers "
for (( b=0; b < $peopleNumber; b++ ))
do
echo ""
   echo ${name[$b]}": "${quarterlysales[$b]}    # or do whatever with individual element of the array
   echo ""

#echo ${quarterlysales[$i]}
done
    echo "Press ENTER button to select an option from the menu ! "       
;;
        

###########################################################################################

"Sorting data by name")

function name_alphabetical()
{   #
    # 
    #
    # Bubble sorting lets the heaviest element sink to the bottom.
    #
    (($# > 0)) && name=("$@")
    local j=0 ubound=$((${#name[*]} - 1))
    while ((ubound > 0))
    do
#########################
        local i=0
        while ((i < ubound))
        do
#########################
            if [ "${name[$i]}" \> "${name[$((i + 1))]}" ]
            then
######################
                local t="${name[$i]}"
                name[$i]="${name[$((i + 1))]}"
                name[$((i + 1))]="$t"
		t=${quarterlysales[$i]}
		n=$i+1 
		quarterlysales[$i]=${quarterlysales[$n]}
		n=$i+1
		quarterlysales[$n]=$t
##############################
            
fi
################################
            ((++i))
        done
        ((++j))
        ((--ubound))
    done
  
}
#invoke function for this array
name_alphabetical ${name[@]} 
#take array length
tLen=${#name[@]}

# loop to print name next to salary
for (( i=0; i<${tLen}; i++ ));
do
echo ""
   echo ${name[$i]}": "${quarterlysales[$i]}    # or do whatever with individual element of the array
   echo ""
done

echo "Press ENTER button to select an option from the menu ! "
        ;; 

"Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done


################################################################################################################
S3='Would you like to save data to a file? '
options=("Save data to file" "No thanks")
select opt in "${options[@]}"
do
    case $opt in
        "Save data to file")
c2=${#name[@]}
c3=${#quarterlysales[@]}

for (( k = 0; k < c2; k++ ))
do

echo ${name[$k]} >> "/home/smasko/salesPerson.txt"

done


for (( n = 0; n < c3; n++ ))
do

echo ${quarterlysales[$n]} >> "/home/smasko/salesPerson.txt"

done



	    ;;
        "No thanks")
           break
            ;;
       
        *) echo invalid option;;
    esac
done






##########################   END OF SCRIPT   #################################################################

