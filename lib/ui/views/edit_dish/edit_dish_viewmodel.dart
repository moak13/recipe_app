import 'package:receipe_app/ui/views/edit_dish/edit_dish_view.form.dart';
import 'package:stacked/stacked.dart';

class EditDishViewModel extends FormViewModel {
  List<String> _allIngredients = [];
  List<String> get allIngredients => _allIngredients;

  void addTextFieldInputToList(String? input) {
    if (input != null && input.isNotEmpty) {
      _allIngredients.add(input);
    }
    _allIngredients = _allIngredients;
    ingredientsValue = '';
    notifyListeners();
  }

  void removeIngredientFromList(int index) {
    _allIngredients.removeAt(index);
    notifyListeners();
  }
}
