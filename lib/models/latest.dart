
class Latest {
  bool ? adult;
  dynamic ? backdropPath;
  dynamic ? belongsToCollection;
  int ?budget;
  List<dynamic>? genres;
  String ? homepage;
  int ?id;
  String? imdbId;
  String ?originalLanguage;
  String ?originalTitle;
  String ?overview;
  int ?popularity;
  dynamic? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries> ?productionCountries;
  String ?releaseDate;
  int ?revenue;
  int ?runtime;
  List<SpokenLanguages>? spokenLanguages;
  String ?status;
  String ?tagline;
  String ?title;
  bool ?video;
  int ?voteAverage;
  int ?voteCount;
    int? status_code;
  String? status_message;
  bool? success;

  Latest({this.adult, this.backdropPath, this.belongsToCollection, this.budget, this.genres, this.homepage, this.id, this.imdbId, this.originalLanguage, this.originalTitle, this.overview, this.popularity, this.posterPath, this.productionCompanies, this.productionCountries, this.releaseDate, this.revenue, this.runtime, this.spokenLanguages, this.status, this.tagline, this.title, this.video, this.voteAverage, this.voteCount});

  Latest.fromJson(Map<String, dynamic> json) {
      if (json["success"] is bool) {
      success = json["success"];
    }
     if (json["status_message"] is String) {
      status_message = json["status_message"];
    }
     if (json["status_code"] is int) {
      status_code = json["status_code"];
    }
    if(json["adult"] is bool) {
      adult = json["adult"];
    }
    backdropPath = json["backdrop_path"];
    belongsToCollection = json["belongs_to_collection"];
    if(json["budget"] is int) {
      budget = json["budget"];
    }
    if(json["genres"] is List) {
      genres = json["genres"] ?? [];
    }
    if(json["homepage"] is String) {
      homepage = json["homepage"];
    }
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["imdb_id"] is String) {
      imdbId = json["imdb_id"];
    }
    if(json["original_language"] is String) {
      originalLanguage = json["original_language"];
    }
    if(json["original_title"] is String) {
      originalTitle = json["original_title"];
    }
    if(json["overview"] is String) {
      overview = json["overview"];
    }
    if(json["popularity"] is int) {
      popularity = json["popularity"];
    }
    posterPath = json["poster_path"];
    if(json["production_companies"] is List) {
      productionCompanies = json["production_companies"]==null ? null : (json["production_companies"] as List).map((e)=>ProductionCompanies.fromJson(e)).toList();
    }
    if(json["production_countries"] is List) {
      productionCountries = json["production_countries"]==null ? null : (json["production_countries"] as List).map((e)=>ProductionCountries.fromJson(e)).toList();
    }
    if(json["release_date"] is String) {
      releaseDate = json["release_date"];
    }
    if(json["revenue"] is int) {
      revenue = json["revenue"];
    }
    if(json["runtime"] is int) {
      runtime = json["runtime"];
    }
    if(json["spoken_languages"] is List) {
      spokenLanguages = json["spoken_languages"]==null ? null : (json["spoken_languages"] as List).map((e)=>SpokenLanguages.fromJson(e)).toList();
    }
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["tagline"] is String) {
      tagline = json["tagline"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["video"] is bool) {
      video = json["video"];
    }
    if(json["vote_average"] is int) {
      voteAverage = json["vote_average"];
    }
    if(json["vote_count"] is int) {
      voteCount = json["vote_count"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
      data["success"] = success;
        data["status_message"] = status_message;
        data["status_code"] = status_code;
    data["adult"] = adult;
    data["backdrop_path"] = backdropPath;
    data["belongs_to_collection"] = belongsToCollection;
    data["budget"] = budget;
    if(genres != null) {
      data["genres"] = genres;
    }
    data["homepage"] = homepage;
    data["id"] = id;
    data["imdb_id"] = imdbId;
    data["original_language"] = originalLanguage;
    data["original_title"] = originalTitle;
    data["overview"] = overview;
    data["popularity"] = popularity;
    data["poster_path"] = posterPath;
    if(productionCompanies != null) {
      data["production_companies"] = productionCompanies?.map((e)=>e.toJson()).toList();
    }
    if(productionCountries != null) {
      data["production_countries"] = productionCountries?.map((e)=>e.toJson()).toList();
    }
    data["release_date"] = releaseDate;
    data["revenue"] = revenue;
    data["runtime"] = runtime;
    if(spokenLanguages != null) {
      data["spoken_languages"] = spokenLanguages?.map((e)=>e.toJson()).toList();
    }
    data["status"] = status;
    data["tagline"] = tagline;
    data["title"] = title;
    data["video"] = video;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    return data;
  }
}

class SpokenLanguages {
  String? englishName;
  String ?iso6391;
  String ?name;

  SpokenLanguages({this.englishName, this.iso6391, this.name});

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    if(json["english_name"] is String) {
      englishName = json["english_name"];
    }
    if(json["iso_639_1"] is String) {
      iso6391 = json["iso_639_1"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["english_name"] = englishName;
    data["iso_639_1"] = iso6391;
    data["name"] = name;
    return data;
  }
}

class ProductionCountries {
  String? iso31661;
  String ?name;

  ProductionCountries({this.iso31661, this.name});

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    if(json["iso_3166_1"] is String) {
      iso31661 = json["iso_3166_1"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["iso_3166_1"] = iso31661;
    data["name"] = name;
    return data;
  }
}

class ProductionCompanies {
  int ?id;
  dynamic? logoPath;
  String ?name;
  String ?originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    logoPath = json["logo_path"];
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["origin_country"] is String) {
      originCountry = json["origin_country"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["logo_path"] = logoPath;
    data["name"] = name;
    data["origin_country"] = originCountry;
    return data;
  }
}