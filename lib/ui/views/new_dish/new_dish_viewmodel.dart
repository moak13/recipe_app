import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/app/app.logger.dart';
import 'package:receipe_app/data_model/create_dish_info.dart';
import 'package:receipe_app/exceptions/receipe_exceptions.dart';
import 'package:receipe_app/generated/l10n.dart';
import 'package:receipe_app/services/dish_service.dart';

import 'package:receipe_app/ui/views/new_dish/new_dish_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NewDishViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final DishService _dishService = locator<DishService>();
  final _dialogService = locator<DialogService>();

  final _logger = getLogger('NewDishViewModel');

  Future<void> createDish() async {
    _logger.i("tapped");
    setBusy(true);
    try {
      CreateDishInfo info = CreateDishInfo(
        name: dishValue?.trim(),
        instructions: instructionValue?.trim(),
        ingredients: [ingredientValue?.trim()],
      );

      final response = await _dishService.createDish(info);

      if (response != null) {
        DialogResponse<dynamic>? dialogResponse =
            await _dialogService.showDialog(
          description: response,
        );
        if (dialogResponse?.confirmed == true) {
          _navigationService.back();
        }
      }
    } on RecipeException catch (e) {
      _dialogService.showDialog(
        description: e.message,
      );
    } catch (e, s) {
      _logger.e('An error occurred while create dish', e, s);
      _dialogService.showDialog(
        description: S.current.unknown_error,
      );
    } finally {
      setBusy(false);
    }
  }

  void navigateToHome() {
    _navigationService.back();
  }
}
