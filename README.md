# flutter_to_existingApp
adding flutter to existing native app

# FLUTTER WITH EXISTING IOS APP
  # adding flutter module
    - flutter create --template module my_flutter
  # adding pathhs for ios and flutter differntly 
  
    some/path/
    
├── my_flutter/

│   └── .ios/

│       └── Flutter/

│         └── podhelper.rb

└── MyApp/

    └── Podfile
  # subclass appdelegate
  # initalize flutter engine and use flutter controller and method channnels to send data back and forth 
