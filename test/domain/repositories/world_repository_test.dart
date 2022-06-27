import 'package:flatlas/domain/repositories/world_repository.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });
  test('load world', () async {
    // GIVEN
    final repository = WorldRepository();

    // WHEN
    final world = await repository.loadWorld();

    // THEN
    expect(true, world.isNotEmpty);
  });
}
