import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_colorful_search/flutter_colorful_search.dart';

void main() {
  group('FlutterColorfulSearch Widget Tests', () {
    testWidgets('Displays full text when searchText is empty', (WidgetTester tester) async {
      const listItem = 'Flutter is awesome';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FlutterColorfulSearch(
              listItem: listItem,
              searchText: '',
            ),
          ),
        ),
      );

      expect(find.text(listItem), findsOneWidget);
    });

    testWidgets('Highlights matched text', (WidgetTester tester) async {
      const listItem = 'Flutter is awesome';
      const searchText = 'is';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FlutterColorfulSearch(
              listItem: listItem,
              searchText: searchText,
            ),
          ),
        ),
      );

      final richText = tester.widget<RichText>(find.byType(RichText));
      final textSpan = richText.text as TextSpan;
      final spans = textSpan.children!;

      // Expect structure: ['Flutter ', 'is', ' awesome']
      expect(spans.length, 3);
      expect((spans[0] as TextSpan).text, 'Flutter ');
      expect((spans[1] as TextSpan).text, 'is');
      expect((spans[2] as TextSpan).text, ' awesome');

      // Check that highlightTextStyle is applied to 'is'
      final highlightSpan = spans[1] as TextSpan;
      expect(highlightSpan.style?.color, Colors.red);
      expect(highlightSpan.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('Highlights multiple occurrences', (WidgetTester tester) async {
      const listItem = 'is this it? this is it!';
      const searchText = 'is';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FlutterColorfulSearch(
              listItem: listItem,
              searchText: searchText,
            ),
          ),
        ),
      );

      final richText = tester.widget<RichText>(find.byType(RichText));
      final spans = (richText.text as TextSpan).children!;

      // There should be multiple 'is' matches highlighted
      final highlighted = spans.where((span) =>
      span is TextSpan &&
          (span.text?.toLowerCase() == 'is') &&
          span.style?.color == Colors.red &&
          span.style?.fontWeight == FontWeight.bold
      );
      expect(highlighted.length, 3); // 'is', 'this', 'is' => total 3 "is"
    });
  });
}
