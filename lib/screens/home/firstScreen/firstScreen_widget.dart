import 'package:flutter/material.dart';

import '../../../models/popular.dart';

class FirstScreenWidget extends StatelessWidget {
  Results result;
  FirstScreenWidget(this.result, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        Container(
          color: Colors.black,
          padding: EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network("https://image.tmdb.org/t/p/w500${result.posterPath}", width: 200,
                                  fit: BoxFit.cover),
          ),
        ),
      
      ],
    );
  }
}
