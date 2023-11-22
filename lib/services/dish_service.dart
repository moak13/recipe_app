import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/app/app.logger.dart';
import 'package:receipe_app/data_model/create_dish_info.dart';
import 'package:receipe_app/exceptions/receipe_exceptions.dart';
import 'package:receipe_app/services/dio_service.dart';

import '../data_model/recipes_response.dart';

class DishService {
  final _logger = getLogger('DishService');
  final _dioService = locator<DioService>();

  Future<String?> createDish(CreateDishInfo info) async {
    try {
      final response = await _dioService.post(
        path: '/dish',
        data: info.toJSON(),
      );
      _logger.i('createDishResponse: $response');
      return response["message"];
    } on RecipeException {
      _logger.e('Application Error trying to create a dish');
      rethrow;
    } catch (e, s) {
      _logger.e('Error trying to create a dish', e, s);
      rethrow;
    }
  }

  Future<RecipesResponseModel> getAllDishes() async {
    try {
      final response = await _dioService.get(
        path: '/dish',
      );
      _logger.v('gotten dishes: $response');
      return RecipesResponseModel.fromJson(response);
    } on RecipeException {
      _logger.e('Application Error trying to get a dishes');
      rethrow;
    } catch (e, s) {
      _logger.e('Error trying to get a dishes', e, s);
      rethrow;
    }
  }
}
