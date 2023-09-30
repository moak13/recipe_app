import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'my_dish_screen_viewmodel.dart';

class MyDishScreenView extends StackedView<MyDishScreenViewModel> {
  const MyDishScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MyDishScreenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  MyDishScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MyDishScreenViewModel();
}
