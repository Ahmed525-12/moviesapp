// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../models/discovery.dart';

class DiscoveryWidget extends StatelessWidget {
  ResultsDiscovery resultsDiscovery;
  DiscoveryWidget(this.resultsDiscovery,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
      child: Row(
        children: [
          Image.network(
        "https://image.tmdb.org/t/p/w500/${resultsDiscovery.posterPath}",
        width: 150,
        fit: BoxFit.cover,
      ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${resultsDiscovery.title}",
                    style: const TextStyle(
                        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${resultsDiscovery.releaseDate}",
                    style: const TextStyle(
                        color: Color.fromARGB(223, 255, 255, 255),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${resultsDiscovery.voteAverage}",
                    style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    )
    );
  }
}
