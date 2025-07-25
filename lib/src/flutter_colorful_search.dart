import 'package:flutter/material.dart';

/// A widget that highlights the [searchText] in the given [listItem] string.
///
/// This widget is useful when building search lists where matched substrings
/// need to be highlighted for better visibility.
class FlutterColorfulSearch extends StatelessWidget {
  /// The full text to be displayed.
  final String listItem;

  /// The text to highlight inside the [listItem].
  final String searchText;

  /// The style to apply to non-highlighted parts of the [listItem].
  final TextStyle? normalTextStyle;

  /// The style to apply to the highlighted [searchText] inside the [listItem].
  final TextStyle? highlightTextStyle;

  /// Creates a [FlutterColorfulSearch] widget.
  ///
  /// The [listItem] and [searchText] are required. Styles are optional and
  /// default values are provided.
  const FlutterColorfulSearch({
    super.key,
    required this.listItem,
    required this.searchText,
    this.normalTextStyle,
    this.highlightTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    if (searchText.isEmpty) {
      return Text(
        listItem,
        style:
            normalTextStyle ??
            const TextStyle(color: Colors.black, fontSize: 14.2),
      );
    }

    final List<TextSpan> spans = [];
    int start = 0;
    final String lowerCaseText = listItem.toLowerCase();
    final String lowerCaseSearchTerm = searchText.toLowerCase();

    while (true) {
      final index = lowerCaseText.indexOf(lowerCaseSearchTerm, start);

      if (index == -1) {
        spans.add(
          TextSpan(
            text: listItem.substring(start),
            style:
                normalTextStyle ??
                const TextStyle(color: Colors.black, fontSize: 14.2),
          ),
        );
        break;
      }

      /// Add unhighlighted part before match
      if (index > start) {
        spans.add(
          TextSpan(
            text: listItem.substring(start, index),
            style:
                normalTextStyle ??
                const TextStyle(color: Colors.black, fontSize: 14.2),
          ),
        );
      }

      /// Add highlighted match
      spans.add(
        TextSpan(
          text: listItem.substring(index, index + searchText.length),
          style:
              highlightTextStyle ??
              const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      );

      /// Update start for next iteration
      start = index + searchText.length;
    }

    return RichText(text: TextSpan(children: spans));
  }
}
