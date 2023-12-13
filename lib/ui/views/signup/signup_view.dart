import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/generated/l10n.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/extension/build_context_extension.dart';
import 'package:receipe_app/ui/utilities/validation.dart';
import 'package:receipe_app/ui/widgets/common/overlay_loader/overlay_loader.dart';
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
  FormTextField(name: 'phoneNumber'),
])
class SignupView extends StackedView<SignupViewModel> with $SignupView {
  SignupView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _signupKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: OverlayLoader(
          isBusy: viewModel.isBusy,
          content: SingleChildScrollView(
            padding: EdgeInsets.only(
                left: sidePadding,
                right: sidePadding,
                bottom: sidePadding + 20.h),
            child: Form(
              key: _signupKey,
              child: Column(
                children: [
                  Image.asset(
                    AppImages.splashLogo,
                    height: 72.h,
                  ),
                  SizedBox(
                    height: 33.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      S.current.sign_up,
                      style: context.typography?.headlineBold28
                          ?.copyWith(color: context.palette?.gray11),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Kindly fill the form to create a Kally Dish account",
                      style: context.typography?.titleRegular16
                          ?.copyWith(color: context.palette?.gray8),
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
                    decoration: InputDecoration(
                      labelText: S.current.first_name,
                      hintText: S.current.enter_your_first_name,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextFormField(
                    controller: lastNameController,
                    focusNode: lastNameFocusNode,
                    validator: Validation.validateField,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: S.current.last_name,
                      hintText: S.current.enter_your_last_name,
                    ),
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
                    decoration: InputDecoration(
                        labelText: S.current.email_address,
                        hintText: S.current.enter_your_email),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextFormField(
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    obscureText: viewModel.hidePassword,
                    textInputAction: TextInputAction.next,
                    validator: Validation.validateField,
                    decoration: InputDecoration(
                      labelText: S.current.password,
                      hintText: S.current.enter_your_password,
                      suffixIcon: IconButton(
                        onPressed: viewModel.togglePassword,
                        icon: Icon(
                          viewModel.hidePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: viewModel.hidePassword
                              ? context.palette!.primary6
                              : context.palette!.gray9,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextFormField(
                    controller: phoneNumberController,
                    focusNode: phoneNumberFocusNode,
                    autofillHints: const [AutofillHints.telephoneNumber],
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    validator: Validation.validateField,
                    decoration: InputDecoration(
                      labelText: "Phone number",
                      hintText: "Enter phone number",
                    ),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  PrimaryButton(
                    buttonText: S.current.sign_up,
                    onTap: () {
                      if (_signupKey.currentState?.validate() ?? false) {
                        viewModel.signup();
                      }
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text.rich(
                    TextSpan(
                      text: S.current.already_have_an_account,
                      style: context.typography?.titleRegular16?.copyWith(
                          color: context.palette?.gray8, fontSize: 14.sp),
                      children: [
                        const TextSpan(text: " "),
                        TextSpan(
                            text: S.current.login,
                            style: context.typography?.titleBold16?.copyWith(
                              color: context.palette?.primary6,
                              fontSize: 14.sp,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = viewModel.actionRouteToLoginView)
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
