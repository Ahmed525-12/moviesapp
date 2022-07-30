// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:moviesapp/screens/home/firstScreen/secondscreendet/secondListDet.dart';

import '../../../models/recomendation.dart';

class SecondWidget extends StatelessWidget {
  SecondWidget(this.results, {Key? key}) : super(key: key);
  ResultsRecom results;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(SecondListDet.routeName, arguments: results);
      },
      child: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
              "https://image.tmdb.org/t/p/w500${results.posterPath}",
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
