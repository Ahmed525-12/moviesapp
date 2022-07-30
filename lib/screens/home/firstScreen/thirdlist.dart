import 'package:flutter/material.dart';
import 'package:moviesapp/screens/home/firstScreen/thirdlist_widget.dart';

import '../../../apis/api_manager.dart';
import '../../../models/top_rated.dart';

class ThirdList extends StatelessWidget {
  const ThirdList({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return
      FutureBuilder<TopRated>(
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
            var resultList = snapshot.data?.results?? [];
            return ListView.builder(
               scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ThirdListWidget(resultList[index]);
              },
              itemCount: resultList.length,
            );
          },
          future: ApiManager.getTopRated(),
        )
    ;
  }
}
