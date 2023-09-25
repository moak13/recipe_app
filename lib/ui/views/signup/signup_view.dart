import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';
import 'package:receipe_app/ui/utilities/validation.dart';
import 'package:receipe_app/ui/widgets/common/primary_button/primary_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'signup_view.form.dart';
import 'signup_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'firstName'),
  FormTextField(name: 'lastName'),
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])

class SignupView extends StackedView<SignupViewModel> with $SignupView {
  const SignupView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _signupKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
  ) {
     final ThemeData theme = Theme.of(context);
    final AppTypography? typography = theme.extension<AppTypography>();
    final Palette? palette = theme.extension<Palette>();
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            left: sidePadding, right: sidePadding, bottom: sidePadding + 20.h),
        child: Form(
          key: _signupKey,
          child: Column(
            children: [
              Image.asset(
                AppImages.logo,
                height: 72.h,
              ),
              SizedBox(
                height: 33.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sign up",
                  style: typography?.headlineBold28
                      ?.copyWith(color: palette?.gray11),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Kindly fill the form to create a Kally Dish account",
                  style: typography?.titleRegular16
                      ?.copyWith(color: palette?.gray8),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              TextFormField(
                controller: firstNameController,
                focusNode: firstNameFocusNode,
                validator: Validation.validateField,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    labelText: "First Name", hintText: "First Name"),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormField(
                controller: lastNameController,
                focusNode: lastNameFocusNode,
                validator: Validation.validateField,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    labelText: "Last Name", hintText: "Last Name"),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormField(
                controller: emailController,
                focusNode: emailFocusNode,
                autofillHints: const [AutofillHints.email],
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: Validation.validateEmail,
                decoration: const InputDecoration(
                    labelText: "Email Address", 
                    hintText: "Email Address"),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormField(
                controller: passwordController,
                focusNode: passwordFocusNode,
                obscureText: viewModel.hidePassword,
                  textInputAction: TextInputAction.done,
                validator: Validation.validateField,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Password",
                  suffixIcon: IconButton(
                    onPressed: viewModel.togglePassword,
                    icon: Icon(
                      viewModel.hidePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 129.h,
              ),
              PrimaryButton(
                buttonText: "Sign up",
                onTap: () {
                  if (_signupKey.currentState?.validate() ?? false) {
                    viewModel.signup();
                  }
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Text.rich(TextSpan(
                  text: "Already have an account?",
                  style: typography?.titleRegular16
                      ?.copyWith(color: palette?.gray8, fontSize: 14.sp),
                  children: [
                    const TextSpan(text: " "),
                    TextSpan(
                        text: "Login",
                        style: typography?.titleBold16?.copyWith(
                          color: palette?.primary6,
                          fontSize: 14.sp,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = viewModel.actionRouteToLoginView)
                  ]))
            ],
          ),
        ),
      ),
    );
  }

   @override
  void onViewModelReady(SignupViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(SignupViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
