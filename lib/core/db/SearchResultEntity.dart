class SearchResultEntity {
  SearchResultEntity({required this.key, required this.data});

  SearchResultEntity.fromJson(dynamic json) {
    key = json['key'];
    data = json['data'];
  }

  String? key;
  String? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = key;
    map['data'] = data;
    return map;
  }
}
