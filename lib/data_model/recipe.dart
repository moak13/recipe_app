class Recipe {
  int? id;
  String? name;
  String? instructions;
  List<String>? ingredients;
  String? datePosted;
  String? dishImageUrl;

  Recipe({
    this.id,
    this.name,
    this.instructions,
    this.ingredients,
    this.datePosted,
    this.dishImageUrl,
  });

  Recipe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    instructions = json['instructions'];
    ingredients = json['ingredients'].cast<String>();
    datePosted = json['date_posted'];
    dishImageUrl = json['dish_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['instructions'] = instructions;
    data['ingredients'] = ingredients;
    data['date_posted'] = datePosted;
    data['dish_image_url'] = dishImageUrl;
    return data;
  }
}
