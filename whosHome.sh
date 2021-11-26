#!/bin/bash
while true
do
	#This runs an arp scan and lists all of the mac addresses on my network
	sudo arp-scan -l > arpScan.txt
	

	#We then have a series of if statements to check for my housmates Mac addresses
	if grep -q 82:af:0b:d7:c9:65 arpScan.txt 
	then 
		
		occupant1="Paul"
	else 
    #If the MAC address is not found then we will write and empty string to the variable
		occupant1=""
	fi
	if grep -q b2:60:77:57:c7:3e arpScan.txt 
	then
		occupant2="James"
	else
		occupant2=""
	fi
	if grep -q e4:a7:c5:e4:85:ca arpScan.txt 
	then

		occupant3="Andrew"
	else
		occupant3=""
	fi
    #you can edit the code to add as many if else statements as you need to check for every mac address you have
    #I have added some extra lines below that you can add more addresses with. Just uncomment them if you are using them.
    
    #if grep -q xx:xx:xx:xx:xx:xx arpScan.txt 
	#then

	#	occupant4="Jess"
	#else
	#	occupant4=""
	#fi
    #if grep -q xx:xx:xx:xx:xx:xx arpScan.txt 
	#then

	#	occupant5="Sarah"
	#else
	#	occupant5=""
	#fi
    #if grep -q xx:xx:xx:xx:xx:xx arpScan.txt 
	#then

	#	occupant6="Romina"
	#else
	#	occupant6=""
	#fi
    

	echo "Occupant 1 ${occupant1}"
	echo "Occupant 2 ${occupant2}"
	echo "Occupant 3 ${occupant3}" 
    
    #echo "Occupant 4 ${occupant4}"
	#echo "Occupant 5 ${occupant5}"
	#echo "Occupant 6 ${occupant6}" 
    
	#We then output some html code to a file to be served on the webserver on the pi
	echo "<link rel="stylesheet" href=style.css>
<h1 class="title">Who's Home?<img src="https://img.icons8.com/fluency/48/000000/home.png"/></h1><h1>$occupant1 <br>$occupant2<br> $occupant3</h1>" > /var/www/html/index.nginx-debian.html
	
    #We then want the program to sleep for 5 minutes before scanning the network again.
    #You can adjust this time but beware of flooding the network with traffic if repeated to frequently
    sleep 5m
done
