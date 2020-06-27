echo '''
                   
   ___                ___
  |   \              /   |  
  ||   \\          //   || 
  ||    \\        //    ||  
  ||     \\      //     ||   __________     __________
  ||      \\    //      ||  |   ____   |   |  ________)
  ||       \\  //       ||  |  |    |  |   |  |
  ||        \\//        ||  |  |    |  |   |  |
  ||                    ||  |  |____|  |_  |  |_______
  ||                    ||  \____________) |__________)
  
  
  
           
                                     '''
date
sleep 1
echo "Do you have installed macchanger, if no get installed. Extra 20 kB will be used, proceed? (Y/N)"
read opt
case $opt in
	y)
		sudo apt-get install macchanger
		;;
	n)
		exit
		;;
	Y)
		sudo apt-get install macchanger
		;;
	N)
		exit
		;;
esac
echo '''Enter device type: 
        1) LAN
	2) Wireless Network'''
read type
case $type in
	1)      
		echo "Enter LAN Card Name"
		read ecard
		echo "1) Show LAN MAC address"  $ecard  
		echo "2) Fully change LAN MAC address" $ecard
		echo "3) Change LAN MAC address without changing vendor bytes" $ecard
		echo "4) Change LAN MAC address of same vendor kind" $ecard
		echo "5) Change LAN MAC address of any vendor"  $ecard
		echo "6) Reset original LAN MAC address" $ecard
		echo "99) Exit"
		echo "Enter Choice:"
		read choice1
		case $choice1 in
		1)
		echo $(sudo macchanger -s $ecard)
		;;
		2)	
		echo $(sudo macchanger -r $ecard)
		;;
		3)
		echo $(sudo macchnager -e $ecard)
		;;
		4)
		echo $(sudo macchanger -a $ecard)
		;;
		5)
		echo $(sudo macchanger -A $ecard)
		;;
		6) 
		echo $(sudo macchanger -p $ecard)
		;;	
		99)
		exit 99
    	        ;;
                esac 
		;;
	  	
	2)	
		echo "WARNING: Upon executing this shell your internet will went down, Don't worry simply enter make any choice. ENJOY!" 
	        echo Enter Wireless Network Card Name
                read ncard
		sudo ifconfig $ncard down
		echo "1) Show wireless MAC address" $ncard  
		echo "2) Fully change LAN MAC address" $ncard
		echo "3) Change LAN MAC address without changing vendor bytes" $ncard
		echo "4) Change LAN MAC address of same vendor kind" $ncard
		echo "5) Change LAN MAC address of any vendor" $ncard
		echo "6) Reset original LAN MAC address" $ncard
		echo "99) Exit"
                echo Enter Choice
                read choice2
                case $choice2 in
                1)
		echo $(macchanger -s $ncard)
		sudo ifconfig $ncard up
		;;
	        2)
		echo $(sudo macchanger -r $ncard)
		sudo ifconfig $ncard up
		;;
		3)
	   	echo $(sudo macchanger -e $ncard)
		sudo ifconfig $ncard up
		;;	
		4)
		echo $(sudo macchanger -a $ncard)
		sudo ifconfig $ncard up
		;;
		5)	
		echo $(sudo macchanger -A $ncard)
		sudo ifconfig $ncard up
		;;
		6)
		echo $(sudo macchanger -p $ncard)
		sudo ifconfig $ncard up
		;;	
                99)
		sudo ifconfig $ncard up	
                exit 99    
                ;;
		esac
   		;;
esac

