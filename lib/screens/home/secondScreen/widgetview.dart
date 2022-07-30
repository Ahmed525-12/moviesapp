// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../models/search.dart';

class WidgetView extends StatelessWidget {
  ResultsSearch resultsSearch;
  WidgetView(this.resultsSearch, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            "${resultsSearch.title}",
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${resultsSearch.releaseDate}",
            style: const TextStyle(
                color: Color.fromARGB(223, 255, 255, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${resultsSearch.voteAverage}",
            style: const TextStyle(
                color: Colors.yellow,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
