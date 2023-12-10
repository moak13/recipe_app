import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/data_model/recipe.dart';
import 'package:receipe_app/exceptions/receipe_exceptions.dart';
import 'package:receipe_app/generated/l10n.dart';
import 'package:receipe_app/services/dish_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SingleUserViewModel extends FutureViewModel<List<Recipe>?> {
  
  final _navigationService = locator<NavigationService>();
  final _dishService = locator<DishService>();


  Future<List<Recipe>?> _getDishes() async {
    try {
      final response = await _dishService.getAllDishes();
      return response.recipes;
    } on RecipeException catch (e) {
      setError(true);
      setMessage(e.message);
      return null;
    } catch (e) {
      setError(true);
      setMessage(S.current.unknown_error);
      return null;
    }
  }

  void navigateToHome() {}

  void navigateToAddProduct() {}

  void navigateToDishDetailsView() {}
  
  @override
  Future<List<Recipe>?> futureToRun() {
    // TODO: implement futureToRun
    throw UnimplementedError();
  }


}
