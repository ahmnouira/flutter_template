import 'package:flutter_template/main.dart' as app_main;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing the root widget', () {
    testWidgets("Making sure that 'main()' doesn't throw", (tester) async {
      var throws = false;

      try {
        app_main.main();
      } catch (e) {
        throws = true;
      }
      expect(throws, isFalse);
    });
  });
}
