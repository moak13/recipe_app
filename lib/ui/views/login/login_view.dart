import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/generated/l10n.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';
import 'package:receipe_app/ui/utilities/validation.dart';
import 'package:receipe_app/ui/widgets/common/primary_button/primary_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  LoginView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
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
          key: _formKey,
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
                  S.current.welcome,
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
                  S.current.please_sign_in_to_continue,
                  style: typography?.titleRegular16
                      ?.copyWith(color: palette?.gray8),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              TextFormField(
                controller: emailController,
                focusNode: emailFocusNode,
                autofillHints: const [AutofillHints.email],
                keyboardType: TextInputType.emailAddress,
                validator: Validation.validateEmail,
                decoration: InputDecoration(
                  labelText: S.current.email_address,
                  hintText: S.current.enter_your_email,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormField(
                controller: passwordController,
                focusNode: passwordFocusNode,
                obscureText: viewModel.hideText,
                validator: Validation.validateField,
                decoration: InputDecoration(
                  labelText: S.current.password,
                  hintText: S.current.enter_your_password,
                  suffixIcon: IconButton(
                    onPressed: viewModel.toggleVisibility,
                    icon: Icon(viewModel.hideText
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                ),
              ),
              SizedBox(
                height: 253.h,
              ),
              PrimaryButton(
                buttonText: S.current.login,
                onTap: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    viewModel.login();
                  }
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Text.rich(
                TextSpan(
                    text: S.current.dont_have_an_account,
                    style: typography?.titleRegular16?.copyWith(
                      color: palette?.gray8,
                      fontSize: 14.sp,
                    ),
                    children: [
                      const TextSpan(text: " "),
                      TextSpan(
                          text: S.current.sign_up,
                          style: typography?.titleBold16?.copyWith(
                            color: palette?.primary6,
                            fontSize: 14.sp,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = viewModel.actionRouteToSignUpView),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(LoginViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
