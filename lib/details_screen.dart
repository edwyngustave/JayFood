import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:jayfood/home_screen.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

final args = Get.arguments as DetailsArgument;

bool isFavorite = false;

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: const Text("Details", style: TextStyle(
          color: Colors.black,
        ),),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black,),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            color: Colors.red.withOpacity(0.4),
            child: Image.asset(
              args.foodImage,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20,),
          Container(
            color: Colors.grey.withOpacity(0.1),
            height: 50,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 5, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 10,),
                Text(args.foodName, style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),),
                Expanded(child: Container()),
                Text(args.foodPrice, style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),),

            ],)
          ),
          SizedBox(height: 40,),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(args.foodDescription, style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),),
          ),
          SizedBox(height: 40,),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Ajouter au panier"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });                   },
                  child: isFavorite == true ? Icon(Icons.favorite):  const Icon(Icons.favorite_border),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}