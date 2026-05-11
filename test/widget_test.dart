import 'package:cake_shop/app.dart';
import 'package:cake_shop/provider/cart_provider.dart';
 
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('App launches and shows splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CartProvider(),
        child: const CakeShopApp(),
      ),
    );

    // Splash screen should show app name
    expect(find.text('Sweet Layers'), findsOneWidget);
  });
}