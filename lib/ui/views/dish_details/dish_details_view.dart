import 'package:flutter/material.dart';
import 'package:receipe_app/data_model/product_model.dart';
import 'package:receipe_app/ui/views/dish_details/dish_details_viewmodel.dart';
import 'package:receipe_app/ui/views/dish_details/widgets/dish_detail_bottom.dart';
import 'package:receipe_app/ui/views/dish_details/widgets/dish_image_header.dart';
import 'package:stacked/stacked.dart';

class DishDetailsView extends StatelessWidget {
  const DishDetailsView({
    Key? key,
    required this.productModel,
  }) : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DishDetailsViewModel>.reactive(
      viewModelBuilder: () => DishDetailsViewModel(),
      builder: (
        BuildContext context,
        DishDetailsViewModel viewModel,
        Widget? child,
      ) {
        return Scaffold(
          body: Stack(
            children: [

              ///Displays the image of the Dish
              DishImageHeader(productModel: productModel),

              /// This shows the lower part of the Screen
              DishDetailBottom(productModel: productModel),
              
            ],
          ),
        );
      },
    );
  }
}
