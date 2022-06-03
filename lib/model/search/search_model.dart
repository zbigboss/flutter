class SearchModel {
  final List<String> defaultSearchHotWords;
  final List<String> hotWordList;

  const SearchModel({
    required this.defaultSearchHotWords,
    required this.hotWordList,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      defaultSearchHotWords:
          json['data']['defaultSearchHotWords'].cast<String>(),
      hotWordList: json['data']['hotWordList'].cast<String>(),
    );
  }
}
