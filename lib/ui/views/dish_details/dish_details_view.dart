import 'package:flutter/material.dart';
import 'package:receipe_app/data_model/product_model.dart';
import 'package:receipe_app/ui/views/dish_details/dish_details_viewmodel.dart';
import 'package:receipe_app/ui/views/dish_details/widgets/dish_detail_bottom.dart';
import 'package:receipe_app/ui/views/dish_details/widgets/dish_image_header.dart';
import 'package:stacked/stacked.dart';

class DishDetailsView extends StackedView<DishDetailsViewModel> {
  const DishDetailsView({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget builder(
    BuildContext context,
    DishDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Stack(
        children: [
          ///Displays the image of the Dish
          DishImageHeader(product: product),

          /// This shows the lower part of the Screen
          DishDetailBottom(product: product),
        ],
      ),
    );
  }

  @override
  DishDetailsViewModel viewModelBuilder(BuildContext context) =>
      DishDetailsViewModel();
}
