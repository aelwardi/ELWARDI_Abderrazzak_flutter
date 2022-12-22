import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapplication/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState()=> _SignUpState();
}
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldMessengerState> _scaffoldkey = GlobalKey<ScaffoldMessengerState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(p);
late String email;
late String password;
void validation() async{
  UserCredential result;
  final _form = _formKey.currentState;

  if(!_form!.validate()){
    try {
      result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
      print(result);
    } on PlatformException catch(e){
      _scaffoldkey.currentState?.showSnackBar(
          SnackBar(
              content: Text(e.toString()),
          ),
      );
    }
  }else{
    print("No");
  }
}
bool obserText = true;
class _SignUpState extends State<SignUp> {
  Widget _buildAllTextFormFeild(){
    return Container(
      height: 330,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextFormField(
            validator: (value){
              if(value==""){
                return "Please Fill UserName";
              }
              else if(value!.length < 6 ){
                return "UserName is Too shprt";
              }
              return "";
            },
            decoration: InputDecoration(
              hintText: "UserName",
              border: OutlineInputBorder(),
            ),
          ),
          TextFormField(
            onChanged: (value){
              setState(() {
                email = value;
              });
            },
            validator: (value){;
              if(value == "" ){
                return "Please Fill Email";
              }
              else if(!regExp.hasMatch(value!)){
                return "Email Is Invaid";
              }
              return "";
            },
            decoration: InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          TextFormField(
            obscureText: obserText,
            onChanged: (value){
              setState(() {
                password = value;
              });
            },
            validator: (value){
              if(value == "" ){
                return "Please Fill Password";
              }
              else if(value!.length < 8){
                return "Password Is Too short";
              }
              return "";
            },
            decoration: InputDecoration(
              hintText: "Password",
              suffixIcon: GestureDetector(
                onTap: (){
                  setState(() {
                    obserText = !obserText;
                  });
                  FocusScope.of(context).unfocus();
                },
                child: Icon(
                  obserText == true? Icons.visibility: Icons.visibility_off,
                  color: Colors.black,
                ),
              ),
              border: OutlineInputBorder(),
            ),
          ),
          TextFormField(
            validator: (value){
              if(value == "" ){
                return "Please Fill Phone Number";
              }
              else if(value!.length < 11){
                return "Phone Number Is Invaid";
              }
              return "";
            },
            decoration: InputDecoration(
              hintText: "Phone Number",
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildBottonPart(){
    return Container(
      height: 400,
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildAllTextFormFeild(),
          Container(
            height: 45,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                validation();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff746bc9)),
              ),
              child: Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Text("I Have Already An Account!"),
              SizedBox(width: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => Login(),
                    ),
                  );
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      key: _scaffoldkey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 220,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _buildBottonPart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}