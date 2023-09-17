import 'package:flutter/material.dart';
import 'package:receipe_app/ui/widgets/common/custom_input_field/custom_input_field.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomInputField(
              controller: TextEditingController(),
              focusNode: FocusNode(),
              hint: 'email',
              label: 'Email',
            ),
          ],
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
