import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapplication/screens/homepage.dart';
import 'package:myapplication/screens/signup.dart';
import 'package:myapplication/widgets/mybutton.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
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
  final FormState? _form = _formKey.currentState;
  if(!_form!.validate()){
    try{
      result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(result);
    }on PlatformException catch(e){
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
class _LoginState extends State<Login> {
  Widget _buildAllParty(){
    return Container(
        height: 500,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Login',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              onChanged: (value){
                setState(() {
                  email = value;
                });
              },
              validator: (value){
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
              onChanged: (value){
                setState(() {
                  password = value;
                });
              },

              obscureText: obserText,
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
            Container(
              height: 45,
              width: double.infinity,

              child:// MyButton(name: "Login",validation,)
              ElevatedButton(
                onPressed: () {
                  validation();
                },
                style:  ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff746bc9)),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Text("I Have Not Account!"),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => SignUp(),
                      ),
                    );
                  },
                  child: Text(
                    "SignUp",
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
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildAllParty(),
              ]
          ),
        ),
      ),
    );
  }
}
