import 'package:stacked/stacked.dart';

class DishDetailsViewModel extends BaseViewModel {
  /// List of Ingredient for a selected Dish
  List<String> get listOfIngredientContent => _listOfIngredientContent;

  List<String> _listOfIngredientContent = [
    'Fresh Tomatoes',
    'Vegetable Oil',
    '4 Cups Of White Rice',
    '1 Teaspoon of Sugar',
  ];

  /// The data that passes the instruction to prepare a particular Dish
  Map<String, String> instructionsForADish = {
    "Step 1": "Wash tomatoes, garlic, pepper, d one onion blend",
    "Step 2": "Blend and marinate chicken",
    "Step 3": "Get a clean pot and put rice and beans",
    "Step 4": "Leave to cook till it burns",
  };
}
