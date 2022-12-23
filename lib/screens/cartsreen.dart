import 'package:flutter/material.dart';
import 'package:myapplication/screens/chekout.dart';

class CartScreen extends StatefulWidget {
  final double price;
  final String name;
  final String image;
  CartScreen({required this.image, required this.name, required this.price});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int count = 1;
  Widget _buildSignleCartProduct(){
    return Container(
      height: 150,
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 130,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        "images/${widget.image}",
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 140,
                  width: 200,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.name,
                        ),
                        Text(
                          "Cloths",
                        ),
                        Text(
                          "\$ ${widget.price.toString()}",
                          style: TextStyle(
                            color: Color(0xff9b9646),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 120,
                          color: Color(0xfff2f2f2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    if(count > 1){
                                      count--;
                                    }
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                ),
                              ),
                              Text(
                                count.toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    count++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10,),
        padding: EdgeInsets.only(
          bottom: 10,
        ),
        child: ElevatedButton(
          onPressed: (){
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (ctx)=>CheckOut(
                      image: widget.image,
                      name: widget.name,
                      price: widget.price
                  ),
              ),
            );
          },
          child: Text(
              "Continus",
          ),
          style:  ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )
            ),
            backgroundColor: MaterialStateProperty.all(
              Color(0xff746bc9),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cart Page",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                _buildSignleCartProduct(),
                _buildSignleCartProduct(),
                _buildSignleCartProduct(),
                _buildSignleCartProduct(),
                _buildSignleCartProduct(),
                _buildSignleCartProduct(),
                _buildSignleCartProduct(),
                _buildSignleCartProduct(),
                _buildSignleCartProduct(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
