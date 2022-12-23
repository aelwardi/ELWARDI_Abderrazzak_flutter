import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:myapplication/screens/detailscreen.dart';
import '../widgets/singeproduct.dart';
import 'listproduct.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*Widget _buildFeaturedProduct({required String name, required double price, required String image}){
    return  Card(
      child: Container(
        height: 250,
        width: 160,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10,),
              child: Container(
                height: 190,
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("images/$image"),
                  ),
                ),
              ),
            ),
            Text(
              "\$ $price",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Color(0xff9b96d6),
              ),
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }*/
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
        AssetImage("images/userImage.png"),
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
            ),
            _buildCategoryProduct(
              image: "userImage.png",
              color: 0xfffc6c8d,
            ),
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
                      name: "Man Long T-Shirt",
                      price: 30.0,
                      image: "man.jpg"
                  )
                  )
              );
            },
            child: SingleProduct(

              name: "Man Long T-Shirt",
              price: 30.0,
              image: "man.jpg",
            ),
          ),
          GestureDetector(
            onTap : (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx)=>DetailScreen(
                      name: "Man Long T-Shirt",
                      price: 30.0,
                      image: "man.jpg"
                  )
                  )
              );
            },
            child: SingleProduct(
                name: "Women Long T-Shirt",
                price: 30.0,
                image: "women.jpg"),
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
                              name: "Man Long T-Shirt",
                              price: 30.0,
                              image: "man.jpg"
                          )
                          )
                      );
                    },
                    child: SingleProduct(
                      name: "Man Long T-Shirt",
                      price: 30.0, image: "man.jpg",
                    ),
                  ),
                  GestureDetector(
                    onTap : (){
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx)=>DetailScreen(
                              name: "Man Long T-Shirt",
                              price: 30.0,
                              image: "man.jpg"
                          )
                          )
                      );
                    },
                    child: SingleProduct(
                      name: "Women Long T-Shirt",
                      price: 30.0,
                      image: "women.jpg",
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
      body: Container(
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
      ),
    );
  }
}
