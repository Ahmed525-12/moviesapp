import 'package:flutter/material.dart';
import 'package:moviesapp/apis/api_manager.dart';

import '../../../models/popular.dart';
import 'firstScreen_widget.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: FutureBuilder<Popular>(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator.adaptive());
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  children: [
                    const Text("something get wrong"),
                    ElevatedButton(
                        onPressed: () {}, child: const Text("try agian"))
                  ],
                ),
              );
            } else if (snapshot.data?.success == false) {
              return Center(
                child: Column(
                  children: [
                    Text(snapshot.data?.status_message ?? ""),
                    ElevatedButton(
                        onPressed: () {}, child: const Text("try agian"))
                  ],
                ),
              );
            }
            var resultList = snapshot.data?.results ?? [];
            return ListView.builder(
               scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return FirstScreenWidget(resultList[index]);
              },
              itemCount: resultList.length,
            );
          },
          future: ApiManager.getPopular(),
        ))
      ],
    );
  }
}
