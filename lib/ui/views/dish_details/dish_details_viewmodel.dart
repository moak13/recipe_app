import 'package:receipe_app/app/app.dialogs.dart';
import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/app/app.router.dart';
import 'package:receipe_app/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DishDetailsViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  /// List of Ingredient for a selected Dish
  List<String> get listOfIngredientContent => _listOfIngredientContent;

  List<String> _listOfIngredientContent = [
    'Fresh Tomatoes',
    'Vegetable Oil',
    '4 Cups Of White Rice',
    '1 Teaspoon of Sugar',
  ];

  /// The data that passes the instruction to prepare a particular Dish
  Map<String, String> get instructionsForADish => _instructionsForADish;

  Map<String, String> _instructionsForADish = {
    "Step 1": "Wash tomatoes, garlic, pepper, d one onion blend",
    "Step 2": "Blend and marinate chicken",
    "Step 3": "Get a clean pot and put rice and beans",
    "Step 4": "Leave to cook till it burns",
  };

  /// The data tto be displayed on the PopUpMenu
  Map<int, String> get popUpMenuItems => _popUpMenuItems;

  Map<int, String> _popUpMenuItems = {
    1: 'Edit Dish',
    2: 'Delete Dish',
  };

  /// Navigate To Edit Dish Screen
  void navigateToEditView() {
    _navigationService.navigateToEditDishView();
  }

  /// Displays the delete dish dialog
  void showDeleteDishDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.deleteDish,
      barrierDismissible: true,
      barrierColor: AppColors.barrierColor,
    );
  }
}
