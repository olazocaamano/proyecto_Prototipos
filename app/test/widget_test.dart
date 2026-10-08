//prueba basica

import 'package:flutter_test/flutter_test.dart';
import 'package:app/main.dart';

void main() {

  testWidgets(
    'La aplicación inicia correctamente',
    (WidgetTester tester) async {
      // Construimos nuestra aplicación principal
      await tester.pumpWidget(const MyApp());

      // Comprobamos que aparezca el nombre del sistema
      expect(
        find.text('Sistema Inteligente'),
        findsOneWidget,
      );
    },
  );
}