import 'package:flutter/material.dart';
import 'package:moviesapp/screens/home/firstScreen/fristScreendetials/firstListDet.dart';
import 'package:moviesapp/screens/home/firstScreen/secondscreendet/secondListDet.dart';
import 'package:moviesapp/screens/home/firstScreen/thirdScreenDet/thirdlistdet.dart';
import 'package:moviesapp/screens/home/home.dart';
import 'package:moviesapp/screens/home/thirdScreen/showdiscovery.dart';

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
        scaffoldBackgroundColor: const Color.fromARGB(255, 24, 24, 24),
      ),
      routes: {
        HomePage.routeName:(context) => HomePage(),
        FirstdetList.routeName:(context) => const FirstdetList(),
        SecondListDet.routeName:(context) => const SecondListDet(),
        ThirdListDet.routeName:(context) => const ThirdListDet(),
        ShowDiscovery.routeName:(context) => const ShowDiscovery()
      },
   initialRoute: HomePage.routeName,
    );
  }
}
