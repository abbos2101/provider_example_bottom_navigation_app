import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_app/data/model/model.dart';

void main() {
  final MyModel model = MyModel(name: 'Abror', age: 22);
  test('name', () async => expect(model.name, 'Abror'));
  test('name', () async => expect(model.name, 'Abror'));
  test('getName', () async => expect(await model.getName(), '80034'));
}
