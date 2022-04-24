import 'package:flutter/material.dart';
import 'package:moviesapp/screens/home/firstScreen/firstScreen.dart';
import 'package:moviesapp/screens/home/fourthScreen/fourthScreen.dart';
import 'package:moviesapp/screens/home/secondScreen/secondScreen.dart';
import 'package:moviesapp/screens/home/thirdScreen/thirdScreen.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "homepage";

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: "Home",
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search_rounded),
            label: "Search",
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage("assets/browse.png")),
            label: "Browse",
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon( AssetImage("assets/watchlist.png")),
            label: "Watch List",
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  var tabs = [FirstScreen(), SecondScreen(), ThirdScreen(), FourthScreen()];
}
