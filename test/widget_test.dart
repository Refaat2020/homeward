
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:homeward/ui/screens/login_screen.dart';

void main() {
  testWidgets('login', (WidgetTester tester) async {
    ///find all widgets
    final enterEmail  = find.byKey(ValueKey("email"));
    final enterPassword  = find.byKey(ValueKey("password"));
    final loginButton  = find.byKey(ValueKey("loginButton"));

    // execute the actual test.
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));
    await tester.enterText(enterEmail, "refaat2020@gmail.com");
    await tester.enterText(enterPassword, "123456");
    await tester.tap(loginButton);
    await tester.pump();
    expect(find.text("refaat2020@gmail.com"), findsNothing);

  });
}
