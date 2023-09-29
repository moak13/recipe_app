import 'package:flutter/material.dart';
import 'package:receipe_app/data_model/product_model.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:stacked/stacked.dart';

class HomepageViewModel extends BaseViewModel {
  // final _navigationService = locator<NavigationService>();

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
      image: AppImages.spagLogTwo,
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
      image: AppImages.spagLogFour,
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

  void navigateToAddProduct() {
    debugPrint('Goto add product page');
// TODO navigate to add product page
  }



}
