import 'package:flutter/material.dart';
import 'package:flutter_colorful_search/flutter_colorful_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Colorful Search',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FlutterColorfulSearchingExample(),
    );
  }
}

class FlutterColorfulSearchingExample extends StatefulWidget {
  const FlutterColorfulSearchingExample({super.key});

  @override
  State<FlutterColorfulSearchingExample> createState() =>
      _FlutterColorfulSearchingExampleState();
}

class _FlutterColorfulSearchingExampleState
    extends State<FlutterColorfulSearchingExample> {
  // Sample list of items to search through
  final List<String> items = [
    'apple ',
    'banana',
    'Grape fruit',
    'draGON fruit',
    'pineapple',
    'blueberry',
    'blackberry',
    'kiwi Fruit',
    'guava',
    'watermelon',
    'papaya',
    'orange',
    'lychee',
    'mango tango',
    'peach',
    'plum',
    'strawberry',
    'APPLE cinnamon',
    'lemon lime',
    'cherry blast',
    'coconut',
    'passion fruit',
    'star fruit',
  ];

  String searchTerm = ''; // / The text entered by the user for searching

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 44, 32, 32),
      appBar: AppBar(title: const Text('Flutter Colorful Search Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Search...',
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Color.fromARGB(255, 44, 32, 32),
              ),
              onChanged: (value) {
                setState(() {
                  searchTerm = value.toLowerCase();
                });
              },
            ),

            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: items
                    .where((item) => item.toLowerCase().contains(searchTerm))
                    .length, // Filters matching items
                itemBuilder: (context, index) {
                  final filteredItems = items
                      .where((item) => item.toLowerCase().contains(searchTerm))
                      .toList(); //// Again filter for this build

                  return Card(
                    child: ListTile(
                      tileColor: Colors.black,
                      title: FlutterColorfulSearch(
                        listItem:
                            filteredItems[index], // Actual string to display
                        searchText: searchTerm, // Text to highlight
                        normalTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        highlightTextStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
