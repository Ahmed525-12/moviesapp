// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:moviesapp/screens/home/firstScreen/secondscreendet/smiliarseond.dart';

import '../../../../apis/api_manager.dart';
import '../../../../models/recomendation.dart';
import '../../../../models/smiliar_movie.dart';

class SecondListDet extends StatelessWidget {
  const SecondListDet({Key? key}) : super(key: key);
 static const String routeName = "second det";
  @override
  Widget build(BuildContext context) {
        ResultsRecom results = ModalRoute.of(context)!.settings.arguments as ResultsRecom;

     return Scaffold(
      appBar: AppBar(
        title: Text(
          "${results.title}",
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [  SizedBox(
          height: 1000,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                        "https://image.tmdb.org/t/p/w500${results.backdropPath}",
                        fit: BoxFit.cover),
                  ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Text(
                  "${results.title}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  "${results.releaseDate}",
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                        "https://image.tmdb.org/t/p/w500${results.posterPath}",width: 200,
                        fit: BoxFit.cover),
                  ),
                Expanded(
                  child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${results.overview}",style: const TextStyle(
                          color: Colors.grey,
                      
                          fontWeight: FontWeight.bold),),
                      ),
                    Row(children: [
                      const Icon(Icons.star,color: Colors.yellow,),
                       Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("${results.voteAverage}",
                    style: const TextStyle(
                          color: Colors.grey,
                       
                          fontWeight: FontWeight.bold),),
                     )
                    ],)
                  ],),
                )
                ],
              ),
               const Padding(
                padding: EdgeInsets.all(14),
                child: Text(
                  "More Like This",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
               Expanded(
                 child: FutureBuilder<SmiliarMovie>(
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
                      return SimilarSecond(resultList[index]);
                    },
                    itemCount: resultList.length,
                  );
                         },
                         future: ApiManager.getSmilar(results.id??0),
                       ),
               )
            ],
          ),
        ),],
     
      ),
    );
  }
}
