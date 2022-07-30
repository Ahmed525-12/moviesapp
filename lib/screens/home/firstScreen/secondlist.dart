import 'package:flutter/material.dart';
import 'package:moviesapp/screens/home/firstScreen/secondlist_widget.dart';

import '../../../apis/api_manager.dart';
import '../../../models/recomendation.dart';

class SecondList extends StatelessWidget {
  const SecondList({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return
     FutureBuilder<Recomendation>(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
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
                return SecondWidget(resultList[index]);
              },
              itemCount: resultList.length,
            );
          },
          future: ApiManager.getrecomendtion(),
        )
    ;
  }
}
