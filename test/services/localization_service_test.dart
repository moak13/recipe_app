import 'package:flutter_test/flutter_test.dart';
import 'package:receipe_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('LocalizationServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
