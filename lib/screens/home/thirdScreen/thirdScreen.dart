// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:moviesapp/screens/home/thirdScreen/genere_widget.dart';

import '../../../apis/api_manager.dart';
import '../../../models/geners.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   FutureBuilder<GenersParent>(
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
            var resultList = snapshot.data?.genres ?? [];
            return Column(
              children: [
              const  Text("Browse Category"),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
                    
                    itemBuilder: (context, index) {
                      return GenereWidget(resultList[index])
                      
                      ;
                    },
                    itemCount: resultList.length,
                  ),
                ),
              ],
            );
          },
          future: ApiManager.getGeners(),
        )
    ;
  }
}