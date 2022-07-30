// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:moviesapp/screens/home/firstScreen/fristlist.dart';
import 'package:moviesapp/screens/home/firstScreen/secondlist.dart';
import 'package:moviesapp/screens/home/firstScreen/thirdlist.dart';



class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
            children: const[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("New Release",style: TextStyle(color: Colors.white,fontSize:20
          ,fontWeight:FontWeight.bold ),),
        ),
        Expanded(
         
            child:FirstList()),
            Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Recomended",style: TextStyle(color: Colors.white,fontSize:20
          ,fontWeight:FontWeight.bold ),),
        ),
              Expanded(
                 
            child:SecondList()),
            Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Top Rated",style: TextStyle(color: Colors.white,fontSize:20
          ,fontWeight:FontWeight.bold ),),
        ),
              Expanded(
                 
            child:ThirdList()),
      ],
    );
  }
  
}
