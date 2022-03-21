import 'dart:convert';

List<SearchResult> searchResponseFromJson(String str) => List<SearchResult>.from(json.decode(str).map((x) => SearchResult.fromJson(x)));

String searchResponseToJson(List<SearchResult> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchResult {
  SearchResult({
    required this.word,
    required this.phonetics,
    required this.meanings,
  });

  String? word;
  late List<Phonetic> phonetics;
  List<Meaning>? meanings;

  SearchResult.fromJson(dynamic json) {
    word = json['word'];
    if (json['phonetics'] != null) {
      phonetics = [];
      json['phonetics'].forEach((v) {
        phonetics.add(Phonetic.fromJson(v));
      });
    }
    if (json['meanings'] != null) {
      meanings = [];
      json['meanings'].forEach((v) {
        meanings?.add(Meaning.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['word'] = word;
    map['phonetics'] = phonetics.map((v) => v.toJson()).toList();
    if (meanings != null) {
      map['meanings'] = meanings?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Meaning {
  Meaning({
    required this.partOfSpeech,
    required this.definitions,
  });

  String? partOfSpeech;
  List<Definition>? definitions;

  Meaning.fromJson(dynamic json) {
    partOfSpeech = json['partOfSpeech'];
    if (json['definitions'] != null) {
      definitions = [];
      json['definitions'].forEach((v) {
        definitions?.add(Definition.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['partOfSpeech'] = partOfSpeech;
    if (definitions != null) {
      map['definitions'] = definitions?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Definition {
  Definition({
    required this.definition,
    required this.example,
    required this.synonyms,
  });

  String? definition;
  String? example;
  List<String>? synonyms;

  factory Definition.fromJson(Map<String, dynamic> json) => Definition(
    definition: json["definition"],
    example: json["example"],
    synonyms: json["synonyms"] == null ? null : List<String>.from(json["synonyms"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "definition": definition,
    "example": example,
    "synonyms": synonyms == null ? null : List<dynamic>.from(synonyms!.map((x) => x)),
  };
}

class Phonetic {
  Phonetic({
    required this.text,
    required this.audio,
  });

  String? text;
  String audio;

  factory Phonetic.fromJson(Map<String, dynamic> json) => Phonetic(
    text: json["text"],
    audio: json["audio"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "audio": audio,
  };
}