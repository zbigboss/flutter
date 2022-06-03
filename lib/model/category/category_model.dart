class CategoryModel {
  final List categoryList;

  CategoryModel({
    required this.categoryList,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryList: json['data']['categoryList'],
    );
  }
}
