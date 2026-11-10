import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stateless_lab_exam/main.dart';
import 'package:stateless_lab_exam/shopping_cart_page.dart';

void main() {
  testWidgets('Cart scrolls and logs button presses without changing', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 568);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final messages = <String>[];
    final previousDebugPrint = debugPrint;
    debugPrint = (message, {wrapWidth}) {
      if (message != null) messages.add(message);
    };

    try {
      await tester.pumpWidget(const MyApp());

      expect(find.byType(ShoppingCartPage), findsOneWidget);
      expect(find.byType(CartItemCard), findsNWidgets(3));
      expect(find.text('1'), findsNWidgets(3));

      Future<void> press(Finder control, String message) async {
        await tester.ensureVisible(control);
        await tester.pumpAndSettle();
        await tester.tap(control);
        await tester.pumpAndSettle();
        expect(messages.last, message);
      }

      await press(find.byTooltip('Back'), 'Back clicked');
      await press(find.byTooltip('Cart'), 'Cart clicked');
      await press(find.text('Change'), 'Change delivery address clicked');

      for (final product in ['Wireless Mouse', 'USB-C Hub', 'Laptop Stand']) {
        for (final action in [
          'Increase quantity',
          'Decrease quantity',
          'Remove item',
        ]) {
          final message = '$action: $product';
          await press(find.byTooltip(message), message);
        }
      }

      await press(
        find.text('Place Order'),
        'Place order clicked! Total: PHP 1850.00',
      );

      expect(messages, hasLength(13));
      expect(find.byType(CartItemCard), findsNWidgets(3));
      expect(find.text('1'), findsNWidgets(3));
      expect(find.text('PHP 1,850.00'), findsOneWidget);
      expect(tester.takeException(), isNull);
    } finally {
      debugPrint = previousDebugPrint;
    }
  });
}
