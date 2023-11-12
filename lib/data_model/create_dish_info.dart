class CreateDishInfo {
  String? name, instructions;
  List<String?>? ingredients;

  CreateDishInfo({this.name, this.instructions, this.ingredients});

  Map<String, dynamic> toJSON() {
    return {
      "id": 0,
      "name": name,
      "instructions": instructions,
      "ingredients": ingredients,
      "date_posted": DateTime.now().toUtc().toIso8601String(),
    };
  }
}
