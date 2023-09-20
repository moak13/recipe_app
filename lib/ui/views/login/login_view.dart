import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';
import 'package:receipe_app/ui/widgets/common/primary_button/primary_button.dart';
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
    ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();
    Palette? palette = theme.extension<Palette>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: sidePadding,
            right: sidePadding,
            bottom: sidePadding + 20.h
          ),
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
                  "Welcome",
                  style: typography?.headlineBold28?.copyWith(
                    color: palette?.gray11
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Please sign in to continue",
                  style: typography?.titleRegular16?.copyWith(
                    color: palette?.gray8
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              TextFormField(
                controller: TextEditingController(),
                focusNode: FocusNode(),
                decoration: const InputDecoration(
                  labelText: "Email Address",
                  hintText: "Email Address"
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormField(
                controller: TextEditingController(),
                focusNode: FocusNode(),
                obscureText: viewModel.hideText,                
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Password",
                  suffixIcon: GestureDetector(
                    onTap: viewModel.toggleVisibility,
                    child: Icon(viewModel.hideText ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
              ),
               SizedBox(
                height: 253.h,
              ),
              
              const PrimaryButton(
                buttonText: "Login",
              ),
              SizedBox(
                height: 16.h,
              ),
              Text.rich(
                TextSpan(
                  text: "Don’t have an account? ",
                  style: typography?.titleRegular16?.copyWith(
                    color: palette?.gray8,
                    fontSize: 14.sp,
                  ),
                  children: [
                    TextSpan(
                      text: "Sign Up",
                      style: typography?.titleBold16?.copyWith(
                      color: palette?.primary6,
                      fontSize: 14.sp,                      
                    ),
                    recognizer: TapGestureRecognizer()
                    ..onTap = viewModel.actionRouteToSignUpView
                    ),
                  ]
                ),
              ),

              
            ],
          ),
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
