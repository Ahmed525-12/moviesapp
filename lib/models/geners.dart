
// ignore_for_file: non_constant_identifier_names

class GenersParent {
  List<Genres>? genres;
  int? status_code;
  String? status_message;
  bool? success;
  GenersParent({this.genres});

  GenersParent.fromJson(Map<String, dynamic> json) {
      if (json["success"] is bool) {
      success = json["success"];
    }
     if (json["status_message"] is String) {
      status_message = json["status_message"];
    }
     if (json["status_code"] is int) {
      status_code = json["status_code"];
    }
    if(json["genres"] is List) {
      genres = json["genres"]==null ? null : (json["genres"] as List).map((e)=>Genres.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    
    final Map<String, dynamic> data = <String, dynamic>{};
    if(genres != null) {
       data["success"] = success;
        data["status_message"] = status_message;
        data["status_code"] = status_code;
      data["genres"] = genres?.map((e)=>e.toJson()).toList();
    }
    return data;
  }
}

class Genres {
  int? id;
  String ?name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    return data;
  }
}