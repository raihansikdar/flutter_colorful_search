import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_colorful_search/flutter_colorful_search.dart';

void main() {
  group('FlutterColorfulSearch Widget Tests', () {
    testWidgets('Displays full text when searchText is empty', (
      WidgetTester tester,
    ) async {
      const listItem = 'Flutter is awesome';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FlutterColorfulSearch(listItem: listItem, searchText: ''),
          ),
        ),
      );

      // It should render the full text unmodified
      expect(find.text(listItem), findsOneWidget);
    });

    testWidgets('Highlights a single matched word correctly', (
      WidgetTester tester,
    ) async {
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

      // Expect: 'Flutter ', 'is', ' awesome'
      expect(spans.length, 3);
      expect((spans[0] as TextSpan).text, 'Flutter ');
      expect((spans[1] as TextSpan).text, 'is');
      expect((spans[2] as TextSpan).text, ' awesome');

      // Check highlight style
      final highlightSpan = spans[1] as TextSpan;
      expect(highlightSpan.style?.color, Colors.red);
      expect(highlightSpan.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('Highlights multiple occurrences of search text', (
      WidgetTester tester,
    ) async {
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

      // Count all highlights of 'is' (including inside 'this')
      final highlighted = spans.where(
        (span) =>
            span is TextSpan &&
            span.text!.toLowerCase().contains(searchText) &&
            span.style?.color == Colors.red &&
            span.style?.fontWeight == FontWeight.bold,
      );

      expect(highlighted.length, 4); // 'is', 'this', 'this', 'is'
    });

    testWidgets('Does not highlight if search text is not found', (
      WidgetTester tester,
    ) async {
      const listItem = 'Flutter is amazing';
      const searchText = 'xyz'; // Not found

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

      // It should render the whole text as one span
      final richText = tester.widget<RichText>(find.byType(RichText));
      final spans = (richText.text as TextSpan).children!;
      expect(spans.length, 1);
      expect((spans[0] as TextSpan).text, listItem);
    });

    testWidgets('Highlights text case-insensitively', (
      WidgetTester tester,
    ) async {
      const listItem = 'Flutter IS awesome';
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
      final highlighted = spans.where(
        (span) =>
            span is TextSpan &&
            span.text?.toLowerCase() == searchText &&
            span.style?.color == Colors.red,
      );

      expect(highlighted.length, 1); // Should match 'IS' (case-insensitive)
    });
  });
}
