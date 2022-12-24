import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:myapplication/screens/detailscreen.dart';
import '../widgets/singeproduct.dart';
import 'listproduct.dart';
import '../model/product.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}
Product? menData;
Product? womenData;
var featureSnapShot;
var newAchivesSnapShot;
Product? bulbData;
Product? smartPhoneData;


class _HomePageState extends State<HomePage> {
  var _firestoreInstance = FirebaseFirestore.instance;
  /*List _products = [];
  var _firestoreInstance = FirebaseFirestore.instance;
  fetchProducts() async {
    QuerySnapshot qn = await _firestoreInstance.collection("products").doc("NUbcaw5liPTNz8XwYbOm").collection("featureproduct").get();
    print(qn.docs.length);

    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _products.add({
          "image": qn.docs[i]["image"],
          "name": qn.docs[i]["name"],
          "price": qn.docs[i]["price"],
        });
      }
    });
    return qn.docs;
  }
   */
  Widget _buildCategoryProduct({required String image, required int color}){
    return CircleAvatar(
      maxRadius: 33,
      backgroundColor: Color(color),
      child: Container(
        height: 40,
        child: Image(
          color: Colors.orange,
          image: AssetImage("images/$image"),
        ),
      ),
    );
  }
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

bool homeColor = true;
bool cartColor = false;
bool aboutColor = false;

Widget _buildMyDrawer(){
  return Drawer(
    child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(
            "EL WARDI",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage(
              "images/userImage.png",
            ),
          ),
          decoration: BoxDecoration(
            color: Color(0xfff2f2f2),
          ),
          accountEmail: Text(
            "elwardi@gmail.com",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        ListTile(
          onTap: (){
            setState(() {
              cartColor = false;
              aboutColor = false;
              homeColor = true;
            });
          },
          selected: homeColor,
          leading: Icon(
            Icons.home,
          ),
          title: Text("Home"),
        ),
        ListTile(
          onTap: (){
            setState(() {
              homeColor = false;
              aboutColor = false;
              cartColor = true;
            });
          },
          selected: cartColor,
          leading: Icon(
            Icons.shopping_cart,
          ),
          title: Text("Cart"),
        ),
        ListTile(
          onTap: (){
            setState(() {
              cartColor = false;
              homeColor = false;
              aboutColor = true;
            });
          },
          selected: aboutColor,
          leading: Icon(
            Icons.info,
          ),
          title: Text("About"),
        ),
        ListTile(
          onTap: (){},
          leading: Icon(
            Icons.exit_to_app,
          ),
          title: Text("Logout"),
        ),
      ],
    ),
  );
}
Widget _buildImageSlide(){
  return Container(
    height: 240,
    child: Carousel(
      dotColor: Colors.white,
      autoplay: true,
      showIndicator: false,
      images: [
        AssetImage("images/man.jpg"),
        AssetImage("images/women.jpg"),
        AssetImage("images/camera.jpg"),
      ],
    ),
  );
}
Widget _buildCategory(){
  return Column(
    children: <Widget>[
      Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Categorie",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 10,),
      Container(
        height: 60,
        child: Row(
          children: <Widget>[
            _buildCategoryProduct(
              image: "userImage.png",
              color: 0xff33dcfd,
            ),
            _buildCategoryProduct(
              image: "userImage.png",
              color: 0xfff38cdd,
            ),
            _buildCategoryProduct(
              image: "userImage.png",
              color: 0xff4ff2af,
            ),
            _buildCategoryProduct(
              image: "userImage.png",
              color: 0xff74acf7,
            ),/*
            _buildCategoryProduct(
              image: "userImage.png",
              color: 0xfffc6c8d,
            ),*/
          ],
        ),
      ),
    ],
  );
}
Widget _buildFeature(){
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Featured",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx)=>ListProduct(
                    name: "Fearured",
                    snapShot: featureSnapShot,
                  ),
                ),
              );
            },
            child: Text(
              "View more",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          GestureDetector(
            onTap : (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx)=>DetailScreen(
                      name: menData!.name,
                      price: menData!.price,
                      image: menData!.image
                  )
                  )
              );
            },
            child: SingleProduct(
                name: menData!.name,
                price: menData!.price,
                image: menData!.image
            ),
          ),
          GestureDetector(
            onTap : (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx)=>DetailScreen(
                      name: womenData!.name,
                      price: womenData!.price,
                      image: womenData!.image
                  )
                  )
              );
            },
            child: SingleProduct(
                name: womenData!.name,
                price: womenData!.price,
                image: womenData!.image
            ),
          ),
        ],
      ),
    ],
  );
}
Widget _buildNewAchives(){
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "New Achive",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx)=>ListProduct(
                    name: "New Achive",
                    snapShot: newAchivesSnapShot,
                  ),
                ),
              );
            },
            child: Text(
              "View more",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap : (){
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx)=>DetailScreen(
                              name: smartPhoneData!.name,
                              price: smartPhoneData!.price,
                              image: smartPhoneData!.image
                          )
                          )
                      );
                    },
                    child: SingleProduct(
                        name: smartPhoneData!.name,
                        price: smartPhoneData!.price,
                        image: smartPhoneData!.image
                    ),
                  ),
                  GestureDetector(
                    onTap : (){
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx)=>DetailScreen(
                              name: bulbData!.name,
                              price: bulbData!.price,
                              image: bulbData!.image
                          )
                          )
                      );
                    },
                    child: SingleProduct(
                        name: bulbData!.name,
                        price: bulbData!.price,
                        image: bulbData!.image
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: _buildMyDrawer(),
      appBar: AppBar(
        title: Text(
          "HomePage",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: (){
            _key.currentState?.openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(
                Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: FutureBuilder<dynamic>(
        future: _firestoreInstance.collection("products").doc("NUbcaw5liPTNz8XwYbOm").collection("featureproduct").get(),
        builder: (BuildContext ctx, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: return Center(
              child: CircularProgressIndicator(),
            );
            default:
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              else featureSnapShot = snapshot;
          menData = Product(
              name: featureSnapShot.data.docs[0]["name"],
              image: featureSnapShot.data.docs[0]["image"],
              price: featureSnapShot.data.docs[0]["price"]
          );
              womenData = Product(
                  name: featureSnapShot.data.docs[1]["name"],
                  image: featureSnapShot.data.docs[1]["image"],
                  price: featureSnapShot.data.docs[1]["price"]
              );
          return FutureBuilder(
            future: _firestoreInstance.collection("products").doc("NUbcaw5liPTNz8XwYbOm").collection("newachives").get(),
            builder: (BuildContext context, AsyncSnapshot snapShot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting: 
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  if (snapShot.hasError)
                    return Text('Error: ${snapShot.error}');
                  else
                    Text('Result: ${snapShot.data.docs[1]["price"]}');
                  newAchivesSnapShot = snapShot;
                  bulbData = Product(
                      name: newAchivesSnapShot.data.docs[0]["name"],
                      image: newAchivesSnapShot.data.docs[0]["image"],
                      price: newAchivesSnapShot.data.docs[0]["price"]
                  );
                  smartPhoneData = Product(
                      name: newAchivesSnapShot.data.docs[2]["name"],
                      image: newAchivesSnapShot.data.docs[2]["image"],
                      price: newAchivesSnapShot.data.docs[2]["price"]
                  );
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20,),
                    child: ListView(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              _buildImageSlide(),
                              _buildCategory(),
                              SizedBox(height: 10,),
                              _buildFeature(),
                              SizedBox(height: 10,),
                              _buildNewAchives(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
              }
            }
          );
        }
        }
      ),
    );
  }
}
