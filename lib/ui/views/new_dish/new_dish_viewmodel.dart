import 'package:image_picker/image_picker.dart';
import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/app/app.logger.dart';
import 'package:receipe_app/data_model/create_dish_info.dart';
import 'package:receipe_app/data_model/image_model.dart';
import 'package:receipe_app/exceptions/receipe_exceptions.dart';
import 'package:receipe_app/generated/l10n.dart';
import 'package:receipe_app/services/dish_service.dart';
import 'package:receipe_app/services/image_picker_service.dart';
import 'package:receipe_app/ui/views/new_dish/new_dish_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NewDishViewModel extends FormViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DishService _dishService = locator<DishService>();
  final ImagePickerService _imagePickerService = locator<ImagePickerService>();
  final DialogService _dialogService = locator<DialogService>();

  final _logger = getLogger('NewDishViewModel');

  //Holds Selected Dish Image from Gallery
  XFile? selectedDishImage;

  Future selectImage() async {
    _logger.i("Selecting Image");

    try {
      selectedDishImage = await _imagePickerService.pickImageFromGallery();
      _logger.i('Image file name: ${selectedDishImage!.name}');
      _logger.i('Image file path: ${selectedDishImage!.path}');
      rebuildUi();
      return selectedDishImage;
    } catch (e, s) {
      _logger.e('An error occurred while selecting Image', e, s);
      _dialogService.showDialog(
        description: 'No Image Selected',
      );
    }
  }

  Future<void> createDish() async {
    _logger.i("tapped");
    setBusy(true);
    try {
      CreateDishInfo info = CreateDishInfo(
        name: dishValue?.trim(),
        instructions: instructionValue?.trim(),
        ingredients: [ingredientValue?.trim()],
      );

      ImageModel dishImage = ImageModel(imagePath: selectedDishImage!.name);

      final uploadImageResponse =
          await _dishService.uploadDishImage(dishImage: dishImage);

      final response = await _dishService.uploadDish(info);

      if (response != null || uploadImageResponse != null) {
        DialogResponse<dynamic>? dialogResponse =
            await _dialogService.showDialog(
          description: '$response...$uploadImageResponse',
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
