import 'package:flutter/material.dart';
import 'package:moviesapp/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Color.fromARGB(255, 24, 24, 24),
      ),
      routes: {
        HomePage.routeName:(context) => HomePage(),
      },
   initialRoute: HomePage.routeName,
    );
  }
}
