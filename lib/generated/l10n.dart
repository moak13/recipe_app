// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello World`
  String get hello_word {
    return Intl.message(
      'Hello World',
      name: 'hello_word',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get get_started {
    return Intl.message(
      'Get Started',
      name: 'get_started',
      desc: '',
      args: [],
    );
  }

  /// `Quality Free Delivery`
  String get onboarding_title_one {
    return Intl.message(
      'Quality Free Delivery',
      name: 'onboarding_title_one',
      desc: '',
      args: [],
    );
  }

  /// `Kally Dish offers non-perishable foodstuff at the lowest wholesale price delivered to your doorstep for free`
  String get onboarding_subtitle_one {
    return Intl.message(
      'Kally Dish offers non-perishable foodstuff at the lowest wholesale price delivered to your doorstep for free',
      name: 'onboarding_subtitle_one',
      desc: '',
      args: [],
    );
  }

  /// `Seamless Order`
  String get onboarding_title_two {
    return Intl.message(
      'Seamless Order',
      name: 'onboarding_title_two',
      desc: '',
      args: [],
    );
  }

  /// `With Kally Dish you can place your order from the comfort of your home by calling any of our hotlines`
  String get onboarding_subtitle_two {
    return Intl.message(
      'With Kally Dish you can place your order from the comfort of your home by calling any of our hotlines',
      name: 'onboarding_subtitle_two',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe To Our Store`
  String get onboarding_title_three {
    return Intl.message(
      'Subscribe To Our Store',
      name: 'onboarding_title_three',
      desc: '',
      args: [],
    );
  }

  /// `Kally Dish provides exclusive access to cost-cutting, time saving and stress-reducing benefits through it's membership plan`
  String get onboarding_subtitle_three {
    return Intl.message(
      'Kally Dish provides exclusive access to cost-cutting, time saving and stress-reducing benefits through it\'s membership plan',
      name: 'onboarding_subtitle_three',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `My Dish`
  String get mydish {
    return Intl.message(
      'My Dish',
      name: 'mydish',
      desc: '',
      args: [],
    );
  }

  /// `Please sign in to continue`
  String get please_sign_in_to_continue {
    return Intl.message(
      'Please sign in to continue',
      name: 'please_sign_in_to_continue',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get email_address {
    return Intl.message(
      'Email Address',
      name: 'email_address',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address`
  String get enter_your_email {
    return Intl.message(
      'Enter your email address',
      name: 'enter_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enter_your_password {
    return Intl.message(
      'Enter your password',
      name: 'enter_your_password',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get first_name {
    return Intl.message(
      'First Name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter your first name`
  String get enter_your_first_name {
    return Intl.message(
      'Enter your first name',
      name: 'enter_your_first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get last_name {
    return Intl.message(
      'Last name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter your last name`
  String get enter_your_last_name {
    return Intl.message(
      'Enter your last name',
      name: 'enter_your_last_name',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account?`
  String get dont_have_an_account {
    return Intl.message(
      'Don’t have an account?',
      name: 'dont_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get already_have_an_account {
    return Intl.message(
      'Already have an account?',
      name: 'already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Email cannot be empty`
  String get email_cannot_be_empty {
    return Intl.message(
      'Email cannot be empty',
      name: 'email_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Email must be a valid email address`
  String get email_must_be_a_valid_email {
    return Intl.message(
      'Email must be a valid email address',
      name: 'email_must_be_a_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get required {
    return Intl.message(
      'Required',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `Kindly edit the details below to the reflect the right standard dish information`
  String get kindly_edit {
    return Intl.message(
      'Kindly edit the details below to the reflect the right standard dish information',
      name: 'kindly_edit',
      desc: '',
      args: [],
    );
  }

  /// `Edit Dish`
  String get edit_dish {
    return Intl.message(
      'Edit Dish',
      name: 'edit_dish',
      desc: '',
      args: [],
    );
  }

  /// `Name of Dish`
  String get name_of_dish {
    return Intl.message(
      'Name of Dish',
      name: 'name_of_dish',
      desc: '',
      args: [],
    );
  }

  /// `Instructions`
  String get instructions {
    return Intl.message(
      'Instructions',
      name: 'instructions',
      desc: '',
      args: [],
    );
  }

  /// `Ingredients`
  String get ingredients {
    return Intl.message(
      'Ingredients',
      name: 'ingredients',
      desc: '',
      args: [],
    );
  }

  /// `Click "Done" after your input.`
  String get click_done {
    return Intl.message(
      'Click "Done" after your input.',
      name: 'click_done',
      desc: '',
      args: [],
    );
  }

  /// `Name: `
  String get name {
    return Intl.message(
      'Name: ',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Date Created: `
  String get date_created {
    return Intl.message(
      'Date Created: ',
      name: 'date_created',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this dish?`
  String get are_you_sure {
    return Intl.message(
      'Are you sure you want to delete this dish?',
      name: 'are_you_sure',
      desc: '',
      args: [],
    );
  }

  /// `Delete Dish`
  String get delete_dish {
    return Intl.message(
      'Delete Dish',
      name: 'delete_dish',
      desc: '',
      args: [],
    );
  }

  /// `Create a Dish`
  String get create_a_dish {
    return Intl.message(
      'Create a Dish',
      name: 'create_a_dish',
      desc: '',
      args: [],
    );
  }

  /// `Hi😚, It's time to create that special dish you always desired.\nKindly fill in the details below`
  String get create_a_dish_intro {
    return Intl.message(
      'Hi😚, It\'s time to create that special dish you always desired.\nKindly fill in the details below',
      name: 'create_a_dish_intro',
      desc: '',
      args: [],
    );
  }

  /// `Ingredients of Dish`
  String get ingredient_of_dish {
    return Intl.message(
      'Ingredients of Dish',
      name: 'ingredient_of_dish',
      desc: '',
      args: [],
    );
  }

  /// `Create Dish`
  String get create_dish {
    return Intl.message(
      'Create Dish',
      name: 'create_dish',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection. Please try again later`
  String get no_internet {
    return Intl.message(
      'No Internet Connection. Please try again later',
      name: 'no_internet',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection. It seems like the connection timed out`
  String get connection_timeout {
    return Intl.message(
      'No Internet Connection. It seems like the connection timed out',
      name: 'connection_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Service Unavailable`
  String get service_unavailable {
    return Intl.message(
      'Service Unavailable',
      name: 'service_unavailable',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Error`
  String get unknown_error {
    return Intl.message(
      'Unknown Error',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `HOME`
  String get drawer_home {
    return Intl.message(
      'HOME',
      name: 'drawer_home',
      desc: '',
      args: [],
    );
  }

  /// `Hi`
  String get hi {
    return Intl.message(
      'Hi',
      name: 'hi',
      desc: '',
      args: [],
    );
  }

  /// `MY DISH`
  String get my_dish {
    return Intl.message(
      'MY DISH',
      name: 'my_dish',
      desc: '',
      args: [],
    );
  }

  /// `DARK MODE`
  String get dark_mode {
    return Intl.message(
      'DARK MODE',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `LOGOUT `
  String get logout {
    return Intl.message(
      'LOGOUT ',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `There are no available dish to view currently`
  String get no_dish_available {
    return Intl.message(
      'There are no available dish to view currently',
      name: 'no_dish_available',
      desc: '',
      args: [],
    );
  }

  /// `Generating Recipe contents`
  String get generate_recipe_contents {
    return Intl.message(
      'Generating Recipe contents',
      name: 'generate_recipe_contents',
      desc: '',
      args: [],
    );
  }

  /// `Seems like we got a problem connecting to the server. Kindly try again when you have a stronger network`
  String get connection_error {
    return Intl.message(
      'Seems like we got a problem connecting to the server. Kindly try again when you have a stronger network',
      name: 'connection_error',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
