// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapplication/provider/category_provider.dart';
import 'package:myapplication/provider/product_provider.dart';
import 'package:myapplication/screens/homepage.dart';
import 'package:myapplication/screens/login.dart';
import 'package:myapplication/screens/welcomescreen.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          Provider<ProductProvider>(
            create: (ctx)=>ProductProvider(),
          ),
          Provider<CategoryProvider>(
            create: (ctx)=>CategoryProvider(),
          ),
        ],
        child: StreamBuilder(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (ctx,snapShot){
            if(snapShot.hasData){
              return HomePage();
            }
            else{
              return HomePage();
            }
          },
        ),
      ),
    );
  }
}

