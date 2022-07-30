import 'package:flutter/material.dart';
import 'package:moviesapp/screens/home/firstScreen/firstScreen_widget.dart';

import '../../../apis/api_manager.dart';
import '../../../models/popular.dart';

class FirstList extends StatelessWidget {
  const FirstList({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return
     FutureBuilder<Popular>(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child:  CircularProgressIndicator.adaptive());
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
        )
    ;
  }
}
