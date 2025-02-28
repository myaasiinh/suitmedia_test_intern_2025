
import 'package:flutter_test/flutter_test.dart';
import 'package:suitmedia_test_intern_2025/data/auth/datasource/auth_datasource.dart';


void main() {
  group('Test AuthDataSource', () {
    late AuthDataSource authDataSource;

    setUp(() {
      authDataSource = AuthDataSource();
    });
    test('get user - successful response', () async {
      final response = await authDataSource.getUser(1, 10);

      expect(response?.data.length, equals(10));

    });
  });
}
