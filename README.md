# MessageSplistDemoProject
This is message splist demo project
Here are the key points for this project description
- This project developed using cocoapods 
- One first loading application into iphone. default message inside textview will be this "I can't believe Tweeter now supports chunking my messages, so I don't have to do it myself." inside uitextview
- Chunking will not be applying on message less then or equal to 50 character
- If message is greater then 50 characters then the chunking will be applying wit the part indicator like "1/2" "2/2"
- if you want to write your custom message in textview please make sure to follow the rule of message formating. here is the rule for message formating
Your message must have one "space" character after every 45 character and 4 character will be reserve for part indicator like "1/2 "
- i have written 3 test cases inside Demo_ProjectTests.swift file. First test case will check the logic for correct message format Second testcase function will test the logic for invalid format and third one will check the split function time efficieny  
- I developed this project using cocoapods because i want to integrate twitter sdk for sending tweet but unfortunately I am not able to implement twitter sdk f because i have no twitter app register.I have applied for the twitter app registration.Once twitter team will approve my app then i will have the app access key and secret key. then i will implement the twitter sdk into this projectt. 
