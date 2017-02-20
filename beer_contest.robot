*** Settings ***
Library        	Selenium2Library    

*** Variables ***
${URL}       	http://www.91x.com/free-stuff/best-coast-beer-fest-vip/
${Browser}     	Chrome
${Delay}       	.1s
${FIRST NAME}  	John
${LAST NAME}   	Doe
${ZIP CODE}     99706
${PHONE}	858-651-5050
${EMAIL}	jdoe@westcoastwaffles.com
${BIRTH MONTH}	11
${BIRTH DAY}	23
${BIRTH YEAR}	1980

*** Test Cases ***
91x Beer Contest Entry
	Load Website And Enter Contest
	Log Page Title
	Enter Name
	Enter Email Address
	Enter DOB
	Enter Phone Number
	Enter Zipcode
	Agree To Terms And Submit
	[Teardown]    Close Browser 
	
*** Keywords ***
Load Website And Enter Contest
	Open Browser 		${URL}   ${Browser}
	Set Selenium Speed   	${DELAY}
	Sleep			3s
	
Log Page Title
    Log Title
	
Enter Name
	#The first name input field has the tag "text-input|404", find it and enter First name
	#Snippit example from html:
	# <input class="form-control text-input" data-use-autocomplete="false" 
	# data-field-type="text-input" value="" name="text-input|404" placeholder="" type="text">
	Input Text		text-input|404	${FIRST NAME}
	Input Text		text-input-1|405	${LAST NAME}

Enter Email Address
	Input Text		email|406	${EMAIL}
	
Enter DOB
    Click Element    xpath=//select[@name="gfb-dob-month"]/option[@value="${BIRTH MONTH}"]
    Click Element    xpath=//select[@name="gfb-dob-day"]/option[@value="${BIRTH DAY}"]
    Click Element    xpath=//select[@name="gfb-dob-year"]/option[@value="${BIRTH YEAR}"]
	
Enter Phone Number
	Input Text		text-input-2|409	${PHONE}
	
Enter Zipcode
	Input Text 		text-input-3|408	${ZIP CODE}
	
Agree To Terms And Submit
	Select Checkbox     	terms|907
	Click Button    	Submit
