// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String DishValueKey = 'dish';
const String InstructionValueKey = 'instruction';
const String IngredientValueKey = 'ingredient';

final Map<String, TextEditingController> _NewDishViewTextEditingControllers =
    {};

final Map<String, FocusNode> _NewDishViewFocusNodes = {};

final Map<String, String? Function(String?)?> _NewDishViewTextValidations = {
  DishValueKey: null,
  InstructionValueKey: null,
  IngredientValueKey: null,
};

mixin $NewDishView {
  TextEditingController get dishController =>
      _getFormTextEditingController(DishValueKey);
  TextEditingController get instructionController =>
      _getFormTextEditingController(InstructionValueKey);
  TextEditingController get ingredientController =>
      _getFormTextEditingController(IngredientValueKey);

  FocusNode get dishFocusNode => _getFormFocusNode(DishValueKey);
  FocusNode get instructionFocusNode => _getFormFocusNode(InstructionValueKey);
  FocusNode get ingredientFocusNode => _getFormFocusNode(IngredientValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_NewDishViewTextEditingControllers.containsKey(key)) {
      return _NewDishViewTextEditingControllers[key]!;
    }

    _NewDishViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _NewDishViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_NewDishViewFocusNodes.containsKey(key)) {
      return _NewDishViewFocusNodes[key]!;
    }
    _NewDishViewFocusNodes[key] = FocusNode();
    return _NewDishViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    dishController.addListener(() => _updateFormData(model));
    instructionController.addListener(() => _updateFormData(model));
    ingredientController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    dishController.addListener(() => _updateFormData(model));
    instructionController.addListener(() => _updateFormData(model));
    ingredientController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          DishValueKey: dishController.text,
          InstructionValueKey: instructionController.text,
          IngredientValueKey: ingredientController.text,
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

    for (var controller in _NewDishViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _NewDishViewFocusNodes.values) {
      focusNode.dispose();
    }

    _NewDishViewTextEditingControllers.clear();
    _NewDishViewFocusNodes.clear();
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

  String? get dishValue => this.formValueMap[DishValueKey] as String?;
  String? get instructionValue =>
      this.formValueMap[InstructionValueKey] as String?;
  String? get ingredientValue =>
      this.formValueMap[IngredientValueKey] as String?;

  set dishValue(String? value) {
    this.setData(
      this.formValueMap..addAll({DishValueKey: value}),
    );

    if (_NewDishViewTextEditingControllers.containsKey(DishValueKey)) {
      _NewDishViewTextEditingControllers[DishValueKey]?.text = value ?? '';
    }
  }

  set instructionValue(String? value) {
    this.setData(
      this.formValueMap..addAll({InstructionValueKey: value}),
    );

    if (_NewDishViewTextEditingControllers.containsKey(InstructionValueKey)) {
      _NewDishViewTextEditingControllers[InstructionValueKey]?.text =
          value ?? '';
    }
  }

  set ingredientValue(String? value) {
    this.setData(
      this.formValueMap..addAll({IngredientValueKey: value}),
    );

    if (_NewDishViewTextEditingControllers.containsKey(IngredientValueKey)) {
      _NewDishViewTextEditingControllers[IngredientValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasDish =>
      this.formValueMap.containsKey(DishValueKey) &&
      (dishValue?.isNotEmpty ?? false);
  bool get hasInstruction =>
      this.formValueMap.containsKey(InstructionValueKey) &&
      (instructionValue?.isNotEmpty ?? false);
  bool get hasIngredient =>
      this.formValueMap.containsKey(IngredientValueKey) &&
      (ingredientValue?.isNotEmpty ?? false);

  bool get hasDishValidationMessage =>
      this.fieldsValidationMessages[DishValueKey]?.isNotEmpty ?? false;
  bool get hasInstructionValidationMessage =>
      this.fieldsValidationMessages[InstructionValueKey]?.isNotEmpty ?? false;
  bool get hasIngredientValidationMessage =>
      this.fieldsValidationMessages[IngredientValueKey]?.isNotEmpty ?? false;

  String? get dishValidationMessage =>
      this.fieldsValidationMessages[DishValueKey];
  String? get instructionValidationMessage =>
      this.fieldsValidationMessages[InstructionValueKey];
  String? get ingredientValidationMessage =>
      this.fieldsValidationMessages[IngredientValueKey];
}

extension Methods on FormStateHelper {
  setDishValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DishValueKey] = validationMessage;
  setInstructionValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[InstructionValueKey] = validationMessage;
  setIngredientValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[IngredientValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    dishValue = '';
    instructionValue = '';
    ingredientValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      DishValueKey: getValidationMessage(DishValueKey),
      InstructionValueKey: getValidationMessage(InstructionValueKey),
      IngredientValueKey: getValidationMessage(IngredientValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _NewDishViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _NewDishViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      DishValueKey: getValidationMessage(DishValueKey),
      InstructionValueKey: getValidationMessage(InstructionValueKey),
      IngredientValueKey: getValidationMessage(IngredientValueKey),
    });
