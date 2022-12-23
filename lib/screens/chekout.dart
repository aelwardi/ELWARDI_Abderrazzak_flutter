import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  final double price;
  final String name;
  final String image;
  CheckOut({required this.image, required this.name, required this.price});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int count =1;
  final TextStyle mystyle = TextStyle(fontSize: 18,);
  @override
  Widget build(BuildContext context) {
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
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Quentity"),
                                Text("1"),
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
    Widget _buildBottomDetail({required String startName, required String endName}){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            startName,
            style: mystyle,
          ),
          Text(
            endName,
            style: mystyle,
          ),
        ],
      );
    }
    return  Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10,),
        padding: EdgeInsets.only(
          bottom: 10,
        ),
        child: ElevatedButton(
          onPressed: (){},
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
          "CheckOut Page",
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
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /////////
                _buildSignleCartProduct(),
                _buildSignleCartProduct(),
                _buildSignleCartProduct(),
                _buildSignleCartProduct(),
                _buildSignleCartProduct(),
                _buildSignleCartProduct(),
                Container(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildBottomDetail(
                          startName: "Your Price",
                          endName: "\$ 60.00",
                      ),
                      _buildBottomDetail(
                        startName: "Discount",
                        endName: "\$ 3%",
                      ),
                      _buildBottomDetail(
                        startName: "Shipping",
                        endName: "\$ 60.00",
                      ),
                      _buildBottomDetail(
                        startName: "Total",
                        endName: "\$ 120",
                      ),
                    ],
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
