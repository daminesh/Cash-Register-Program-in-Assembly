;author: Arslan Khurram
;date: 01/02/2022
;TP number: TP058344
;Program Name: APU Cybersecurity Club's Cash Register Program

.model small
.stack 100h
.data

welcome db 10, '              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	db 10, '              |    Welcome to Battle of Hackers Competition!  |'
	db 10, '              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	db 10, '              |                 1- Workshops                  |'
	db 10, '              |                 2- Activities                 |'
	db 10, '              |                 3- Challenges                 |'
	db 10, '              |                 4- Fee Structure              |'
	db 10, '              |                 5- Show Seats                 |'
	db 10, '              |                 6- Donation                   |'
	db 10, '              |                 9- Checkout!                  |'
	db 10, '              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	db 10,13, 'Please, Enter your Choice: $'

error db 10, 'You have entered an Invalid Input, Please try again! $'
addCart db 10, 'Your Shopping Cart has been updated! Deposit Limit is USD 100!! $'
workshopDB db 10, '              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	   db 10, '              ||         You have Selected Workshop, Welcome!         ||'
	   db 10, '              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	   db 10, '              || 1- Introduction to Digital Forensics         - USD 4 ||'
	   db 10, '              || 2- Penetration Testing with Kali Linux       - USD 4 ||'
	   db 10, '              || 3- Advanced Network Forensics:Threat Hunting - USD 4 ||'
	   db 10, '              || 4- Malware Reverse Engineering               - USD 4 ||'
	   db 10, '              || 5- Hacking Web Applications                  - USD 4 ||'
	   db 10, '              || 6- Introduction to Cybersecurity             - USD 4 ||'
	   db 10, '              || 9- Go Back!                                          ||'
	   db 10, '               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	   db 10,13, 'Please, Enter your Choice: $'

activitiesDB db 10, '               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
             db 10, '               ||        You have Selected Activities, Welcome!       ||'
	     db 10, '               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	     db 10, '               || 1- Tickets to the Music Concert             - USD 6 ||'
	     db 10, '               || 2- Cake eating contest                      - USD 6 ||'
	     db 10, '               || 3- Three Question Mingle                    - FREE  ||'
	     db 10, '               || 4- The Alien have Landed                    - USD 6 ||'
	     db 10, '               || 5- Two Truths and a Lie                     - USD 6 ||'
	     db 10, '               || 6- Bucket List                              - USD 6 ||'
	     db 10, '               || 9- Go Back!                                         ||'
	     db 10, '               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	     db 10, 'Please, Enter your Choice: $'
	   
challengesDB db 10, '             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	     db 10, '             ||        You have Selected Challenges, Welcome!       ||'
	     db 10, '             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	     db 10, '             || 1- HACK THIS SITE                           - USD 2 ||'
	     db 10, '             || 2- Capture the Flag                         - USD 2 ||'
	     db 10, '             || 3- CrackME                                  - USD 2 ||'
	     db 10, '             || 4- TotallyNotMalware - Reversing            - USD 2 ||'
	     db 10, '             || 5- RSA                                      - USD 2 ||'
	     db 10, '             || 9- Go Back!                                         ||'
	     db 10, '             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	     db 10, 'Please, Enter your Choice: $'

feeDB      db 10,9, 'You have Selected Fee Structure, Welcome!'
	   db 10,9, '   ~~~~~~~~~~~~~~~~~Challenges~~~~~~~~~~~~~~~~~~~'
	   db 10,9, '1- HACK THIS SITE                           - USD 2'
	   db 10,9, '2- Capture the Flag                         - USD 2'
	   db 10,9, '3- CrackME                                  - USD 2'
	   db 10,9, '4- TotallyNotMalware - Reversing            - USD 2'
	   db 10,9, '5- RSA                                      - USD 2'
	   db 10,9, '   ~~~~~~~~~~~~~~~~~Activities~~~~~~~~~~~~~~~~~~~'
	   db 10,9, '1- Tickets to the Music Concert             - USD 6'
	   db 10,9, '2- Cake eating contest                      - USD 6'
	   db 10,9, '3- Three Question Mingle                    - FREE'
	   db 10,9, '4- The Alien have Landed                    - USD 6'
	   db 10,9, '5- Two Truths and a Lie                     - USD 6'
	   db 10,9, '6- Bucket List                              - USD 6'
	   db 10,9, '   ~~~~~~~~~~~~~~~~~Workshops~~~~~~~~~~~~~~~~~~~'
	   db 10,9, '1- Introduction to Digital Forensics         - USD 4'
	   db 10,9, '2- Penetration Testing with Kali Linux       - USD 4'
	   db 10,9, '3- Advanced Network Forensics:Threat Hunting - USD 4'
	   db 10,9, '4- Malware Reverse Engineering               - USD 4'
	   db 10,9, '5- Hacking Web Applications                  - USD 4'
	   db 10,9, '6- Introduction to Cybersecurity             - USD 4$'

seats1DB db 10, '1- Introduction to Digital Forensics         - Seats $'
seats2DB db 10, '2- Penetration Testing with Kali Linux       - Seats $'
seats3DB db 10, '3- Advanced Network Forensics:Threat Hunting - Seats $'
seats4DB db 10, '4- Malware Reverse Engineering               - Seats $'
seats5DB db 10, '5- Hacking Web Applications                  - Seats $'
seats6DB db 10, '6- Introduction to Cybersecurity             - Seats $'

seatsZero db 10, 'Sorry, Seats not available!$'

;workshop seats   
dfS     db 2
ptS     db 10
nfS	db 12
rS	db 14
hS	db 16
cyS	db 20



membershipDB db 10, '                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	     db 10, '                    ||       Are you a member?     ||'
	     db 10, '                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	     db 10, '                    ||           1- Yes            ||'
	     db 10, '                    ||           2- No             ||'
	     db 10, '                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	     db 10, 'Please, Enter your Choice: $'
donationDB db 10, '               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	   db 10, '               ||  You have Selected Donation :), Welcome!    ||'
	   db 10, '               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	   db 10, '               ||       Please Select Amount to Donate!       ||'
	   db 10, '               ||                  1- USD 1                   ||'
	   db 10, '               ||                  2- USD 5                   ||'
	   db 10, '               ||                  3- USD 10                  ||'
	   db 10, '               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
	   db 10, 'Please, Enter your Choice: $'

clearDB    db 10, ""
	   db 10,9, ""
	   db 10,9, ""
	   db 10,9, ""
	   db 10,9, ""
	   db 10,9, ""
	   db 10,9, ""
	   db 10,9, ""
	   db 10,9, ""
	   db 10,9, ""
	   db 10,9, "$"

thankYou db 10, 'Thank You for for your Donation!$'
currentTotal db 10, 'Your Current Total is USD $'

;workshop pricelist   
digitalForensics        db 4
penetrationTesting      db 4
networkForensics	db 4
reverse			db 4
hacking			db 4
cyber			db 4

;activitiies pricelist
concert			db 6
cake			db 6
threeQuestion		db 0
alien			db 6
truthsLie		db 6
bucketList		db 6

;challenges pricelist
hackThisSite		db 2
captureThisFlag		db 2
crackMe			db 2
Malware			db 2
RSA			db 2

;donation pricelist
usd1 db 1
usd2 db 5
usd3 db 10

;global
total db 0
minus db 0
pay   db 0
totalCheckOut 	db 10, '                              Total Amount -> RM $'
saveMember 	db 10, '                       Saved By Membership -> RM $'
needToPay 	db 10, '                           You Need To Pay -> RM $'
exitMsg 	db 10,'                      ~~~~~~~~~~/ THANK YOU :) & Bye! \~~~~~~~~~~$'
empty		db 10, "$"

.code

ShowMessage Macro Mess	;Macro for Display
       	
	mov ah, 09h
	mov dx, offset Mess
	int 21h
EndM
GetMessage Macro get	;get input from user
	mov ah,1 ;read char
	int 21h
EndM
ShowTotal Macro db ;Display db values, 2 digits
     	mov al,db
	mov bl,0
	add al,bl
	
	aam
	add ax,3030h
	
	mov dh,al
	mov dl,ah
	
	mov ah,2
	int 21h
	
	mov dl,dh
	mov ah,2
	int 21h
EndM
DecSeats Macro val	;get input from user
	mov al,val ;read char
	dec al
	mov val, al
EndM

Main proc
	mov ax,@data
       	mov ds,ax
       	
	welcomePage:
		ShowMessage welcome ;calls Macro to display with parameter welcome
		GetMessage
		
		cmp al, 49 ;comparing input to 49 Decimal which equals to 1 char
		jne two1 ;if comparison is false then jump to activities
		call workshop  ;else it proceeds to workshop function
		jmp loop1   ;after performing workshop start at the welcome screen
	two1:
		cmp al, 50 ;equal to 2
		jne three1
		call activities
		jmp loop1
	three1:
		cmp al, 51 ;equal to 3
		jne four1
		call challenges
		jmp loop1
	four1:
		cmp al, 52 ;equal to 4
		jne five1
		ShowMessage clearDB
		ShowMessage feeDB
		ShowMessage empty
		jmp loop1		
	five1:
		cmp al, 53 ;equal to 5
		jne six1
		call showSeats
		jmp loop1
	six1:
		cmp al, 54 ;equal to 6
		jne exit1
		call donation
		jmp loop1			
	exit1:	
		cmp al, 57 ;equal to 9
		jne invalid1
		jmp end2		
	invalid1:	
		mov ah, 09h
		mov dx, offset error
		int 21h
		jmp loop1	
	loop1:	
		loop welcomePage ;goes back to welcome
	end2:
		call member
		call displayTotal
		mov ah,4ch ;teriminating dos
		int 21h
Main endp

workshop proc
	mov ax,@data
       	mov ds,ax
       	
	workshopPage:
		ShowMessage clearDB
		ShowMessage workshopDB ;calls macro to display message
		GetMessage
	
		cmp al, 49 ;comparing input to 49 Decimal which equals to 1 char
		jne two2 ;if comparison is false then jump to two
		Call SeatCheckdfS ;checking whether seats are zero
		mov al, digitalForensics
		call increment
		DecSeats dfS ;decrement seat by 1
		ret    ; to repeat display this screen
	two2:	
		cmp al, 50 ;equal to 2
		jne three2
		Call SeatCheckptS
		mov al, penetrationTesting ;getting value from db and mov to al
		call increment
		DecSeats ptS ;decrement seat by 1
		ret
	three2:	
		cmp al, 51 ;equal to 3
		jne four2
		Call SeatChecknfS
		mov al, networkForensics
		call increment
		DecSeats nfS ;decrement seat by 1
		ret	
	four2:	
		cmp al, 52
		jne five2
		Call SeatCheckrS
		mov al, reverse
		call increment
		DecSeats rS ;decrement seat by 1
		ret		
	five2:	
		cmp al, 53 ;equal to 5
		jne six2
		Call SeatCheckhS
		mov al, hacking
		call increment
		DecSeats hS ;decrement seat by 1
		ret	
	six2:	
		cmp al, 54 ;equal to 6
		jne exit2
		Call SeatCheckcyS
		mov al, cyber
		call increment
		DecSeats cyS ;decrement seat by 1
		ret	
	exit2:	
		cmp al, 57 ;equal to 9
		jne invalid2
		ShowMessage clearDB
		ret ;return to menu	
	invalid2:
		ShowMessage error
		ret ;return to menu
workshop endp

increment proc
	add al, total ;db value gets added to the total
	mov total, al ;updating total
	mov pay, al ;inc total
	ShowMessage clearDB
	ShowMessage addCart
	ShowMessage currentTotal
	ShowTotal total
	ret ;return to the call
increment endp


activities proc
	mov ax,@data
       	mov ds,ax
       	
	activitiesPage:
		ShowMessage clearDB
		ShowMessage activitiesDB ;calls macro to display message
		GetMessage
	
		cmp al, 49 ;comparing input to 49 Decimal which equals to 1 char
		jne two3 ;if comparison is false then jump to two
		mov al, concert
		call increment
		ret    ; to repeat display this screen
	two3:	
		cmp al, 50 ;equal to 2
		jne three3
		mov al, cake ;getting value from db and mov to al
		call increment
		ret
	three3:	
		cmp al, 51 ;equal to 3
		jne four3
		mov al, threeQuestion
		call increment
		ret		
	four3:	
		cmp al, 52
		jne five3
		mov al, alien
		call increment
		ret		
	five3:	
		cmp al, 53 ;equal to 5
		jne six3
		mov al, truthsLie
		call increment
		ret	
	six3:	
		cmp al, 54 ;equal to 6
		jne exit3
		mov al, bucketList
		call increment
		ret	
	exit3:	
		cmp al, 57 ;equal to 9
		jne invalid3
		ret ;return to menu	
	invalid3:
		ShowMessage error
		ret ;return to menu	
activities endp

challenges proc
	mov ax,@data
       	mov ds,ax
       	
	challengesPage:
		ShowMessage clearDB
		ShowMessage challengesDB ;calls macro to display message
		GetMessage
	
		cmp al, 49 ;comparing input to 49 Decimal which equals to 1 char
		jne two4 ;if comparison is false then jump to two
		mov al, hackThisSite
		call increment
		ret    ; to repeat display this screen
	two4:	
		cmp al, 50 ;equal to 2
		jne three4
		mov al, captureThisFlag ;getting value from db and mov to al
		call increment
		ret
	three4:	
		cmp al, 51 ;equal to 3
		jne four4
		mov al, crackMe
		call increment
		ret	
	four4:	
		cmp al, 52
		jne five4
		mov al, malware
		call increment
		ret	
	five4:	
		cmp al, 53 ;equal to 5
		jne exit4
		mov al, RSA
		call increment
		ret
	exit4:	
		cmp al, 57 ;equal to 9
		jne invalid4
		ret ;return to menu
	invalid4:
		ShowMessage error
		ret ;return to menu
challenges endp

displayTotal proc
	mov ax,@data
       	mov ds,ax
       	
       	showMessage totalCheckOut ;display total message
       	ShowTotal total ;macro shows total
       	ShowMessage empty ;newline
       	
       	showMessage saveMember
       	ShowTotal minus
       	ShowMessage empty
       	
       	showMessage needToPay
       	ShowTotal pay 
       	ShowMessage empty
       	
       	showMessage exitMsg ;prints thank you
	ret ;return to the call
displayTotal endp

member proc
	mov ax,@data
       	mov ds,ax
       	
       	memberPage:
		ShowMessage clearDB
		ShowMessage membershipDB ;calls macro to display message
		GetMessage
	
		cmp al, 49 ;comparing input to 49 Decimal which equals to 1 char
		jne two5 ;if comparison is false then jump to two
		;if he is a member - give discount 50%
		ShowMessage clearDB
		call discount ;do discount
		ret    ; to repeat display this screen
	two5:	
		cmp al, 50 ;equal to 2
		jne invalid5
		ShowMessage clearDB
		ret ; if not a member it just return back to the call without changes
	invalid5:
		ShowMessage error
		jmp loop5
	loop5:	loop memberPage
member endp

discount proc
	mov al, total
	mov bl ,1
	mul bl ;making ax register
	
	mov bl, 2 ;divide by 2 for discount
	div bl ;with ax register from mul
	mov minus,al ;return val
	
	mov pay,al ;give to pay
	
	ret
discount endp

showSeats proc
	ShowMessage empty
	ShowMessage seats1DB
	ShowTotal dfS
	ShowMessage seats2DB
	ShowTotal ptS
	ShowMessage seats3DB
	ShowTotal nfS
	ShowMessage seats4DB
	ShowTotal rS
	ShowMessage seats5DB
	ShowTotal hS
	ShowMessage seats6DB
	ShowTotal cyS
	ShowMessage empty
	ShowMessage empty
	ret
showSeats endp

donation proc
	mov ax,@data
       	mov ds,ax
       	
	donationPage:
		ShowMessage clearDB
		ShowMessage donationDB ;calls macro to display message
		GetMessage
	
		cmp al, 49 ;comparing input to 49 Decimal which equals to 1 char
		jne two6 ;if comparison is false then jump to two
		mov al, usd1
		call increment
		ShowMessage thankYou
		ret    ; to repeat display this screen
	two6:	
		cmp al, 50 ;equal to 2
		jne three6
		mov al, usd2 ;getting value from db and mov to al
		call increment
		ShowMessage thankYou
		ret
	three6:	
		cmp al, 51 ;equal to 3
		jne invalid6
		mov al, usd3
		call increment
		ShowMessage thankYou
		ret	
	invalid6:
		ShowMessage error
		ret ;return to menu
donation endp


SeatCheckdfS proc	;get input from user
	mov al,dfS ;read char
	cmp al, 0

	je checkBad1 ;if equal to zero
	jmp checkGood1
	checkBad1:
		ShowMessage seatsZero
		jmp welcomePage
	checkGood1:
	ret
SeatCheckdfS endp
SeatCheckptS proc	;get input from user
	mov al,ptS ;read char
	cmp al, 0

	je checkBad2 ;if equal to zero
	jmp checkGood2
	checkBad2:
		ShowMessage seatsZero
		jmp welcomePage
	checkGood2:
	ret
SeatCheckptS endp
SeatChecknfS proc	;get input from user
	mov al,nfS ;read char
	cmp al, 0

	je checkBad3 ;if equal to zero
	jmp checkGood3
	checkBad3:
		ShowMessage seatsZero
		jmp welcomePage
	checkGood3:
	ret
SeatChecknfS endp
SeatCheckrS proc	;get input from user
	mov al,rS ;read char
	cmp al, 0

	je checkBad4 ;if equal to zero
	jmp checkGood4
	checkBad4:
		ShowMessage seatsZero
		jmp welcomePage
	checkGood4:
	ret
SeatCheckrS endp
SeatCheckhS proc	;get input from user
	mov al,hS ;read char
	cmp al, 0

	je checkBad5 ;if equal to zero
	jmp checkGood5
	checkBad5:
		ShowMessage seatsZero
		jmp welcomePage
	checkGood5:
	ret
SeatCheckhS endp
SeatCheckcyS proc	;get input from user
	mov al,cyS ;read char
	cmp al, 0

	je checkBad6 ;if equal to zero
	jmp checkGood6
	checkBad6:
		ShowMessage seatsZero
		jmp welcomePage
	checkGood6:
	ret
SeatCheckcyS endp
End main
