import 'package:flutter_test/flutter_test.dart';
import 'package:solaryx/solaryx_app.dart';

void main() {
  testWidgets('SolaryxApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const SolaryxApp());
    expect(find.byType(SolaryxApp), findsOneWidget);
  });
}
