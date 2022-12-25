import 'package:flutter/material.dart';
import 'package:myapplication/model/product.dart';
import 'package:myapplication/screens/homepage.dart';
import 'package:myapplication/widgets/singeproduct.dart';

class ListProduct extends StatelessWidget {
  final String name;
  final List<Product> snapShot;
  ListProduct({
    required this.name,
    required this.snapShot,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: (){
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx)=>HomePage(),
                ),
              );
          },
        ),
        actions: <Widget>[
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search),
            color: Colors.black,
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.notifications_none),
            color: Colors.black,
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20,),
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                Container(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 700,
                  child: GridView.count(
                    crossAxisCount: 2,
                    scrollDirection: Axis.vertical,
                    children: snapShot.map((e) => SingleProduct(
                        image: e.image,
                        price: e .price,
                        name: e.name)
                    ).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
