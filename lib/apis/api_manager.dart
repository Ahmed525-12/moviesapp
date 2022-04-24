import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/geners.dart';
import '../models/latest.dart';
import '../models/popular.dart';
import '../models/search.dart';
import '../models/top_rated.dart';

class ApiManager {
  static const String baseUrl = "api.themoviedb.org";
  static Future<TopRated> getTopRated ()async{
        var url = Uri.https(baseUrl, "/3/movie/top_rated",
        {"apiKey": "f16372b120787be90090618423c85123","language":"en-US"});

    var response = await http.get(url);
    try {
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var topRatedResponse = TopRated.fromJson(json);
      return topRatedResponse;
    } catch (e) {
      rethrow;
    }
  }
  static Future<Latest> getLatest ()async{
        var url = Uri.https(baseUrl, "/3/movie/latest",
        {"api_key": "f16372b120787be90090618423c85123","language":"en-US","page":"1"});

    var response = await http.get(url);
    try {
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var latestResponse = Latest.fromJson(json);
      return latestResponse;
    } catch (e) {
      rethrow;
    }
  }
    static Future<Popular> getPopular ()async{
        var url = Uri.https(baseUrl, "/3/movie/popular",
        {"api_key": "f16372b120787be90090618423c85123","language":"en-US","page":"1"});

    var response = await http.get(url);
    try {
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var popularResponse = Popular.fromJson(json);
      return popularResponse;
    } catch (e) {
      rethrow;
    }
  }
      static Future<Geners> getGeners ()async{
        var url = Uri.https(baseUrl, "/3/genre/movie/list",
        {"api_key": "f16372b120787be90090618423c85123","language":"en-US"});

    var response = await http.get(url);
    try {
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var genersResponse = Geners.fromJson(json);
      return genersResponse;
    } catch (e) {
      rethrow;
    }
  }
       static Future<Search> getSearch (String search)async{
        var url = Uri.https(baseUrl, "/3/search/movie",
        {"api_key": "f16372b120787be90090618423c85123","language":"en-US","query":search,"page":"1","include_adult":"false"});

    var response = await http.get(url);
    try {
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var searchResponse = Search.fromJson(json);
      return searchResponse;
    } catch (e) {
      rethrow;
    }
  }
  
}
