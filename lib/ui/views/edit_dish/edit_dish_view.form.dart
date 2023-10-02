// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String IngredientsValueKey = 'ingredients';

final Map<String, TextEditingController> _EditDishViewTextEditingControllers =
    {};

final Map<String, FocusNode> _EditDishViewFocusNodes = {};

final Map<String, String? Function(String?)?> _EditDishViewTextValidations = {
  IngredientsValueKey: null,
};

mixin $EditDishView {
  TextEditingController get ingredientsController =>
      _getFormTextEditingController(IngredientsValueKey);

  FocusNode get ingredientsFocusNode => _getFormFocusNode(IngredientsValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_EditDishViewTextEditingControllers.containsKey(key)) {
      return _EditDishViewTextEditingControllers[key]!;
    }

    _EditDishViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _EditDishViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_EditDishViewFocusNodes.containsKey(key)) {
      return _EditDishViewFocusNodes[key]!;
    }
    _EditDishViewFocusNodes[key] = FocusNode();
    return _EditDishViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    ingredientsController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    ingredientsController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          IngredientsValueKey: ingredientsController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _EditDishViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _EditDishViewFocusNodes.values) {
      focusNode.dispose();
    }

    _EditDishViewTextEditingControllers.clear();
    _EditDishViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get ingredientsValue =>
      this.formValueMap[IngredientsValueKey] as String?;

  set ingredientsValue(String? value) {
    this.setData(
      this.formValueMap..addAll({IngredientsValueKey: value}),
    );

    if (_EditDishViewTextEditingControllers.containsKey(IngredientsValueKey)) {
      _EditDishViewTextEditingControllers[IngredientsValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasIngredients =>
      this.formValueMap.containsKey(IngredientsValueKey) &&
      (ingredientsValue?.isNotEmpty ?? false);

  bool get hasIngredientsValidationMessage =>
      this.fieldsValidationMessages[IngredientsValueKey]?.isNotEmpty ?? false;

  String? get ingredientsValidationMessage =>
      this.fieldsValidationMessages[IngredientsValueKey];
}

extension Methods on FormStateHelper {
  setIngredientsValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[IngredientsValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    ingredientsValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      IngredientsValueKey: getValidationMessage(IngredientsValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _EditDishViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _EditDishViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      IngredientsValueKey: getValidationMessage(IngredientsValueKey),
    });
