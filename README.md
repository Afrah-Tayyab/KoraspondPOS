1- Instructions on how to set up and run the project.
  the project is created in xcode 15.3 and min ios version is 13.0 with swift 5

2- A brief description of the project structure and design choices.
  for the project thearchitecture pattern i've used MVVM.
  for data storage of item listing and for user registeration i've used Core Data and for cart handling i've used User Defaults.
  for design i've used UIKit (Storyboards, Nibs)
3- Any assumptions made and limitations of the current implementation.

    as per requirements there are following flows in the app

    1- Registeration.
        when user install the app user will create and account and after creating user has to login and after that futher app will be available.
    2- Inventory Management:
      First Tab is Inventory management in which user create, edit and delete that item and also the inventory list is available for user.
    3- Item listing:
      Second Tab is the item listing and user can add to cart the item and also can change the quantity according tot he stock.
    4- Cart listing:
      Thrid is Cart listing when user add any item to cart then it'll be available and after that user have checkout screen in which user has items listing and also the tax and total in it and user can place order and after the placement of order the cart list will be delete and also the inventory item's stock will be updated.
      
        
