// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:moviesapp/screens/home/firstScreen/fristScreendetials/firstListDet.dart';

import '../../../models/popular.dart';

class FirstScreenWidget extends StatelessWidget {
  ResultsPopular result;
  FirstScreenWidget(this.result, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(FirstdetList.routeName,arguments: result);
      },
      child: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
              "https://image.tmdb.org/t/p/w500${result.posterPath}",
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
