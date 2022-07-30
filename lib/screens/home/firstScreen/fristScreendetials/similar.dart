// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../models/smiliar_movie.dart';

class Similar extends StatelessWidget {
  ResultsSmiliar resultsSmiliar;
   Similar(this.resultsSmiliar,{Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(
            "https://image.tmdb.org/t/p/w500${resultsSmiliar.posterPath}",
            fit: BoxFit.cover),
      ),
    );
    
  }
}
