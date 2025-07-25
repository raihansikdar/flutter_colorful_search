# flutter_colorful_search

A lightweight and customizable Flutter widget to highlight matching substrings within a text — ideal for building search suggestions, autocomplete UIs, and keyword highlighting in lists.

---

## ✨ Features

- 🔍 Case-insensitive text matching
- 🎨 Customizable highlight and normal text styles
- 💡 Simple, lightweight, and dependency-free
- 🧩 Easily pluggable in ListViews, search bars, and suggestion widgets

---
| Parameter            | Type         | Description                                                       |
| -------------------- | ------------ | ----------------------------------------------------------------- |
| `listItem`           | `String`     | The full string to be displayed.                                  |
| `searchText`         | `String`     | The string to be highlighted if found in `listItem`.              |
| `normalTextStyle`    | `TextStyle?` | Optional. Style for non-matching text.                            |
| `highlightTextStyle` | `TextStyle?` | Optional. Style for the matching/highlighted portion of the text. |


## 📦 Installation

Add this to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_colorful_search: ^1.0.1
```

## 🧩 Getting Started
Simply import the package in your Dart file:
```
import 'package:flutter_colorful_search/flutter_colorful_search.dart';

```
## ✅ Usage Example
### Go to example section to get full code.
```
 ListTile(
    tileColor: Colors.black,
    title: FlutterColorfulSearch(
      listItem:  filteredItems[index], // Actual string to display
      searchText: searchTerm, // Text to highlight
      normalTextStyle: TextStyle(color: Colors.white,fontSize: 18),
      highlightTextStyle: TextStyle(color: Colors.red,fontSize: 18),
    ),
  ),
                    
```

## 🔍 Search Example
![flutter_colorful_search](https://github.com/raihansikdar/flutter_colorful_search/blob/main/assets/search.gif?raw=true)

## 📝 License
This project is licensed under the MIT License. See the LICENSE file for more details.

```text
MIT License

Copyright (c) 2025 Raihan Sikdar

Permission is hereby granted, free of charge, to any person obtaining a copy...
```
