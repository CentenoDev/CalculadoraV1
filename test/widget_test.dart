import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_v1/main.dart'; 
void main() {
  testWidgets('Calculator test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: CalculatorV1()));

    // Verifica que la pantalla de la calculadora muestre '0' inicialmente.
    expect(find.text('0'), findsOneWidget);

    // Toca el botón '1' y provoca un frame.
    await tester.tap(find.text('1'));
    await tester.pump();

    // Verifica que el número '1' aparezca en la pantalla.
    expect(find.text('1'), findsOneWidget);
  });
}


