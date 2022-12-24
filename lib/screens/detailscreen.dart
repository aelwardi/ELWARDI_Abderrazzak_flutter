import 'package:flutter/material.dart';
import 'package:myapplication/screens/cartsreen.dart';
import 'package:myapplication/screens/homepage.dart';

class DetailScreen extends StatefulWidget {
  final String image;
  final String name;
  final double price;
  DetailScreen({required this.image, required this.name, required this.price});
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    Widget _buildSizeProduct({required String name}){
      return Container(
        height: 60,
        width: 60,
        color: Color(0xfff2f2f2),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ),
      );
    }
    Widget _buildColorProduct({required Color color}){
      return Container(
        height: 60,
        width: 60,
        color: color,
      );
    }
    final TextStyle mystyle = TextStyle(fontSize: 18,);
    Widget _buildImage(){
      return Center(
        child: Container(
          width: 350,
          child: Card(
            child: Container(
              padding: EdgeInsets.all(13),
              child: Container(
                height: 220,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(widget.image),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    Widget _buildNameToDescriptionPart(){
      return Container(
        height: 100,
        child: Row(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "\$ ${widget.price.toString()}",
                  style: TextStyle(
                    color: Color(0xff9b96d6),
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Description",
                  style: mystyle,
                ),
              ],
            ),
          ],
        ),
      );
    }
    Widget _buildDecription(){
      return Container(
        height: 160,
        child: Wrap(
          children: <Widget>[
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ],
        ),
      );
    }
    Widget _buildSizePart(){
      return Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Size",
            style: mystyle,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: 265,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildSizeProduct(
                  name: "S",
                ),
                _buildSizeProduct(
                  name: "M",
                ),
                _buildSizeProduct(
                  name: "L",
                ),
                _buildSizeProduct(
                  name: "XXL",
                ),
              ],
            ),
          ),
        ],
      );
    }
    Widget _buildColorPart(){
      return Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10,),
          Text(
            "Color",
            style: mystyle,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: 265,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildColorProduct(color: Colors.blue,),
                _buildColorProduct(color: Colors.green,),
                _buildColorProduct(color: Colors.yellow,),
                _buildColorProduct(color: Colors.cyan,),
              ],
            ),
          ),
        ],
      );
    }
    Widget _buildQuentityPart(){
      return Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text(
            "Quentity",
            style: mystyle,
          ),
          SizedBox(height: 15,),
          Container(
            height: 40,
            width: 130,
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(20),
            ),
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
                  style: mystyle,
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
      );
    }
    Widget _buildButtonPart(){
      return Column(
        children: <Widget>[
          SizedBox(height: 15,),
          Container(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (ctx)=>CartScreen(
                          image: widget.image,
                          name: widget.name,
                          price: widget.price,
                      ),
                  ),
                );
              },
              style:  ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
                backgroundColor: MaterialStateProperty.all(
                  Color(0xff746bc9),
                ),
              ),
              child: Text(
                "Check Out",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Detail Page",
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
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx)=>HomePage(),
            )
            );
          },
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
            _buildImage(),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildNameToDescriptionPart(),
                  _buildDecription(),
                  _buildSizePart(),
                  _buildColorPart(),
                  _buildQuentityPart(),
                  _buildButtonPart(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
