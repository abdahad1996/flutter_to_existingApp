# flutter_to_existingApp
adding flutter to existing native app

# FLUTTER WITH EXISTING IOS APP
  # adding flutter module
    - flutter create --template module my_flutter
  # adding a root directory and having different folders for existing ios and flutter projects 
  
   MAINPROJECT/
    
├── my_flutterProject/

   └── .ios/

   └── Flutter/

   └── podhelper.rb

├── MyIOSApp/
  
   └── Podfile
  # install flutter module as pod for all individual target
  # subclass appdelegate
  # initalize flutter engine and use flutter controller and method channnels to send data back and forth 
