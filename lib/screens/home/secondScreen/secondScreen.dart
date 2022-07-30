// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:moviesapp/screens/home/secondScreen/widgetview.dart';

import '../../../apis/api_manager.dart';
import '../../../models/search.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String search = "";
  String temporery = "";
  @override
  Widget build(BuildContext context) {
    Widget getImage(String? path) {
      if (path == null) {
        return Image.asset("assets/noimage.png",width: 150,
        fit: BoxFit.cover,);
      }
      return Image.network(
        "https://image.tmdb.org/t/p/w500/$path",
        width: 150,
        fit: BoxFit.cover,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  search = temporery;
                  setState(() {});
                },
                icon: const Icon(Icons.search),
                color: Colors.white,
              ),
              filled: true,
              fillColor: const Color.fromARGB(103, 92, 92, 92),
              contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              hintText: 'search',
              hintStyle: const TextStyle(color: Colors.white),
              focusedBorder: const OutlineInputBorder(
                borderSide:  BorderSide(color: Colors.white),
                borderRadius:  BorderRadius.all(Radius.circular(25)),
              ),
            ),
            style: const TextStyle(color: Colors.white),
            onChanged: (value) {
              temporery = value;
            },
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder<Search>(
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
            itemBuilder: (context, index) {
              return Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: getImage(resultList[index].posterPath),
                      ),
                    ),
                    WidgetView(resultList[index]),
                  ],
                ),
              );
            },
            itemCount: resultList.length,
          );
        },
        future: ApiManager.getSearch(search),
      ),
    );
  }
}
