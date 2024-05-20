import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:stopwatch/core/app_local_storage/app_local_storage.dart';
import 'package:stopwatch/core/enum/themes.dart';

import 'app_local_storage_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AppLocalStorage>()])
void main() {
  final appLocalStorage = MockAppLocalStorage();
  test('Store and retrieve string from SharedPreferences', () async {
    await appLocalStorage.storeThemeString(Themes.light.getValue());
    final retrievedValue = appLocalStorage.readThemeString();

    expect(retrievedValue, isInstanceOf<String>());
  });

  test('Retrieve default value when key is not present', () {
    final retrievedValue = appLocalStorage.readThemeString();

    expect(retrievedValue, isInstanceOf<String>());
  });
}
