import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:jayfood/details_screen.dart';
import 'package:get/get.dart';


 List<Map<String ,dynamic>> carte = [
  {
    "foodName": "Hot-Dog creampie",
    "foodImage": "assets/hotdog.jpg",
    "foodPrice": "12€",
    "foodDescription": "Saucisse de volaille, ketchup, moutarde, oignons frits", 
    "foodType": "Hot-Dog"   
  },

  {
    "foodName": "Bacon Lover",
    "foodImage": "assets/burgers.jpg",
    "foodPrice": "15€",
    "foodDescription": "Steak haché 180g, bacon, sauce barbecue, oignons confits",
    "foodType": "Burger"
  }
  ,{
    "foodName": "Menu Hot-Dog creampie + Frites",
    "foodImage": "assets/hotdog.jpg",
    "foodPrice": "15€",
    "foodDescription": "Saucisse de volaille, ketchup, moutarde, oignons frits", 
    "foodType": "Menu"   
  },

  {
    "foodName": " Menu Bacon Lover + Frites",
    "foodImage": "assets/burgers.jpg",
    "foodPrice": "18€",
    "foodDescription": "Steak haché 180g, bacon, sauce barbecue, oignons confits",
    "foodType": "Menu"
  }
];


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class DetailsArgument {
  
  final String foodName;
  final String foodImage;
  final String foodPrice;
  final String foodDescription;

  DetailsArgument(this.foodName, this.foodImage, this.foodPrice, this.foodDescription);

}

bool menuType = false;
bool hotdogType = false;
bool burgerType = false;
bool shoppingCart= false;
bool accueil = true;
int cart = 0;
List<Map<String, dynamic>> filteredCarte = [];

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    void addCart(){
      cart++;
      }

     if(hotdogType) {
        filteredCarte =  carte.where((item) => item["foodType"] == "Hot-Dog").toList() ;
         }

     else if (burgerType){
            filteredCarte = carte.where((item) => item["foodType"] == "Burger").toList(); 
        }
     else if(menuType){
                filteredCarte =  carte.where((item) => item["foodType"] == "Menu").toList();
          }
        
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 80),
              child: Text("Nos produits", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),)
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
                height: 50,
                width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                     // height: 30,
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          hotdogType = false;
                          burgerType = false;
                          menuType = false;
                          accueil = true;
                          shoppingCart = false;
                        });
                      },
                      child: Text("Accueil", style: TextStyle(color: Colors.black,
                      decoration: accueil? TextDecoration.underline : null,
                      decorationColor: Colors.black,
                      decorationThickness: 1.0,
                      ),),
                    ),
                  ),
                     Container(
                      margin: EdgeInsets.only(left: 20),
                     // height: 30,
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          hotdogType = false;
                          burgerType = false;
                          menuType = true;
                          accueil = false;
                          shoppingCart = false;
                        });
                      },
                      child: Text("Menu", style: TextStyle(color: Colors.black,
                      decoration: menuType? TextDecoration.underline : null,
                      decorationColor: Colors.black,
                      decorationThickness: 1.0,
                      ),),
                    ),
                  ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                     // height: 30,
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          hotdogType = true;
                          burgerType = false;
                          menuType = false;
                          accueil = false;
                          shoppingCart = false;
                        });
                      },
                      child: Text("Hot-Dogs", style: TextStyle(color: Colors.black,
                      decoration: hotdogType? TextDecoration.underline : null,
                      decorationColor: Colors.black,
                      decorationThickness: 1.0,
                      ),),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 20),
                     // height: 30,
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          hotdogType = false;
                          burgerType = true;
                          menuType = false;
                          accueil = false;
                          shoppingCart = false;
                        });
                      },
                      child: Text("Burgers", style: TextStyle(color: Colors.black,
                      decoration: burgerType? TextDecoration.underline : null,
                      decorationColor: Colors.black,
                      decorationThickness: 1.0,
                      ),),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 20),
                     // height: 30,
                    child: IconButton(
                            onPressed: (){
                              setState(() {
                                shoppingCart = true;
                                burgerType = false;
                                menuType = false;
                                hotdogType = false;
                                accueil = false;
                              });
                          }, icon: Icon(Icons.shopping_cart_checkout_outlined, color: Colors.black,))
                
                  ),
                  ],
                ),
                ),
            ),
            SizedBox(height: 20,),
            accueil?
            Container(

            ):
            shoppingCart?
            Container(

            ):
            Container(
                height: 300,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: filteredCarte.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(()=>DetailsPage(), arguments: DetailsArgument(filteredCarte[index]["foodName"], filteredCarte[index]["foodImage"], filteredCarte[index]["foodPrice"], filteredCarte[index]["foodDescription"]));
                        },
                        child: Card(
                          elevation: 10,
                            child: ListTile(
                              contentPadding: EdgeInsets.only(left: 7, right: 10),
                              leading: Container(
                                padding: EdgeInsets.only(top: 0, bottom: 0),
                                width: 80,
                                height: double.infinity,
                                child: Image.asset(filteredCarte[index]["foodImage"], 
                                width: 100,
                                fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                filteredCarte[index]["foodName"], 
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                              ),
                              subtitle: Text(
                                filteredCarte[index]["foodDescription"]),
                              trailing: Text(
                                filteredCarte[index]["foodPrice"]),
                            ),
                        ),
                      );
                    }
                    ),
                ),        
          ],
        ),
        ]
      )
    );
  }
}