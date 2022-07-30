// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:moviesapp/screens/home/thirdScreen/showdiscovery.dart';

import '../../../models/geners.dart';

class GenereWidget extends StatelessWidget {
  Genres genres;
  GenereWidget(this.genres,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
         Navigator.of(context)
            .pushNamed(ShowDiscovery.routeName, arguments: genres);
      },
      child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text("${genres.name}",style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),),
                ),
    );
  }
}
