import 'package:flutter/material.dart';

class FlutterColorfulSearch extends StatelessWidget {
  final String listItem;
  final String searchText;
  final TextStyle? normalTextStyle;
  final TextStyle? highlightTextStyle;

  const FlutterColorfulSearch({
    super.key,
    required this.listItem,
    required this.searchText,
    this.normalTextStyle ,
    this.highlightTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    if (searchText.isEmpty) {
      return Text(listItem, style: normalTextStyle ?? const TextStyle(color: Colors.black, fontSize: 14.2));
    }

    final List<TextSpan> spans = [];
    int start = 0;
    final String lowerCaseText = listItem.toLowerCase();
    final String lowerCaseSearchTerm = searchText.toLowerCase();

    while (true) {
      final index = lowerCaseText.indexOf(lowerCaseSearchTerm, start);

      if (index == -1) {
        spans.add(TextSpan(text: listItem.substring(start), style: normalTextStyle ?? const TextStyle(color: Colors.black, fontSize: 14.2)));
        break;
      }

      // Add unhighlighted part before match
      if (index > start) {
        spans.add(TextSpan(text: listItem.substring(start, index), style: normalTextStyle ?? const TextStyle(color: Colors.black, fontSize: 14.2)));
      }

      // Add highlighted match
      spans.add(
        TextSpan(
          text: listItem.substring(index, index + searchText.length),
          style: highlightTextStyle ?? const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

      // Update start for next iteration
      start = index + searchText.length;
    }

    return RichText(
      text: TextSpan(
        children: spans,
      ),
    );
  }
}

