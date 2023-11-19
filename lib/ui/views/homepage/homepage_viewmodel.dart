import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/app/app.logger.dart';
import 'package:receipe_app/app/app.router.dart';
import 'package:receipe_app/data_model/login_response.dart';
import 'package:receipe_app/data_model/product_model.dart';
import 'package:receipe_app/data_model/user.dart';
import 'package:receipe_app/services/user_service.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomepageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  final _logger = getLogger('Home_View_Model');

  bool _currentThemeValue = false;

  bool get currentThemeValue => _currentThemeValue;

  User? get userDetails => _userService.user;

  void setCurrentTheme(bool value) {
    // print(':::$value:::');
    _logger.d(value);
    _currentThemeValue = value;
    rebuildUi();
  }

  List<ProductModel> productItems = [
    ProductModel(
      date: 'May 28, 2023',
      image: AppImages.spagLog,
      title: 'Spaghetti',
      isLiked: false,
    ),
    ProductModel(
      isLiked: false,
      date: 'May 28, 2023',
      image: AppImages.spagLogFour,
      title: 'Spaghetti',
    ),
    ProductModel(
      isLiked: false,
      date: 'May 28, 2023',
      image: AppImages.spagLogThree,
      title: 'Spaghetti',
    ),
    ProductModel(
      isLiked: true,
      date: 'May 28, 2023',
      image: AppImages.spagLogTwo,
      title: 'Spaghetti',
    ),
    ProductModel(
      isLiked: true,
      date: 'May 28, 2023',
      image: AppImages.spagLog,
      title: 'Spaghetti',
    ),
    ProductModel(
      isLiked: false,
      date: 'May 28, 2023',
      image: AppImages.spagLogTwo,
      title: 'Spaghetti',
    ),
  ];
  void navigateToHome() {
    _navigationService.back();
  }

  void navigateToAddProduct() {
    _navigationService.navigateToNewDishView();
  }

  // navigateToAddProduct(LoginResponse? response) {
  //   _navigationService.navigateTo(Routes.newDishView,

  //       // Error
  //       // arguments: NewDishView(
  //       //   response: response,
  //       // ),

  //       //Correct
  //       arguments: NewDishViewArguments(response: response));
  // }

  void navigateToDishDetailsView(ProductModel product) {
    _navigationService.navigateTo(
      Routes.dishDetailsView,
      arguments: DishDetailsViewArguments(product: product),
    );
  }
}
