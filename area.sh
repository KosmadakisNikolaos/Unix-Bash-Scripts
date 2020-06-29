#!/bin/bash

#Ask user to insert a valid number

echo "Please Insert a number for width : "
# Read from keayboard
read width

while [[ !($width =~ ^[0-9]+\.?[0-9]*$) ]]; # error hanlding (accepting only integer and double numbers)


do
echo "Please insert a valid Number" 

read width # in case user has given an invalid number for width ,he was asked again to give a number

done

#Ask user to insert a valid number
echo "Please Insert a number for height: "
# Read from keayboard
read height

while [[ !($height =~ ^[0-9]+\.?[0-9]*$) ]]; # error hanlding (accepting only integer and double numbers)



do
echo "Please insert a valid Number"

read height # in case user has given an invalid number for height ,he was asked again to give a number
done

echo "Calculating Area : "
result=$(echo "($width * $height) /10000" | bc -l);  # bc stands for basic calculator
                    #saving the multiplication result into $result variable
echo "Area in square meters is :" $result



echo "Press C or c to convert the area to inch"
read Cc #assigning C or c to variable Cc
if [ $Cc = "c" ] || [ $Cc = "C" ]; #pressing c or C should calculate the inches
then

inchResult=$(echo "($result * 10000 / 2.54) / 2.54" | bc -l); ### this is the output result (width * 2.54) * (height * 2.54)
echo "Area is $inchResult inches"
else
echo "Please enter c or C"
break
fi
