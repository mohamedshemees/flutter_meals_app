class Meal {
  String id;
  String name;
  int categoryId;
  double price;
  String description;
  List<String> ingredients;
  List<String> tags;
  bool isFavorite;

  Meal({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.price,
    required this.description,
    required this.ingredients,
    required this.tags,
    required this.isFavorite,
  });
}
