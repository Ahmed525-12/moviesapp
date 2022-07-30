import 'package:flutter/material.dart';
import 'package:moviesapp/screens/home/thirdScreen/discovery_widget.dart';

import '../../../apis/api_manager.dart';
import '../../../models/discovery.dart';
import '../../../models/geners.dart';

class ShowDiscovery extends StatelessWidget {
  static const String routeName = "showdiscovery";
  const ShowDiscovery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Genres results = ModalRoute.of(context)!.settings.arguments as Genres;
    return Scaffold(
      appBar: AppBar(title: Text("${results.name}"),centerTitle: true,backgroundColor: Colors.black,),
      body: FutureBuilder<Discovery>(
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
               
              itemBuilder: (context, index) {
                return DiscoveryWidget(resultList[index]);
              },
              itemCount: resultList.length,
            );
          },
          future: ApiManager.getDiscovery(results.id??14),
        ),
    );
  }
}
