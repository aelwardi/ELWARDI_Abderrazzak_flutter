import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/product.dart';

class CategoryProvider with ChangeNotifier{

  Product? chandailsData;
  List<Product> Chandails = [];
  Future<void> getChandailsData() async {
    List<Product> newList = [];
    QuerySnapshot chandailSnapshot = await FirebaseFirestore.instance
        .collection("category")
        .doc("U9X5Y1q3AblG7GZ6XlIP")
        .collection("Chandails")
        .get();
        chandailSnapshot.docs.forEach((element) {
          chandailsData = Product(
              image: element["image"],
              name: element["name"],
              price: element["price"]
          );
          newList.add(chandailsData!);
        },
      );
    Chandails = newList;
  }
  List<Product> get getChandailsList{
    return Chandails;
  }
}