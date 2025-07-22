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
      title: 'Flutter Demo',
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
  State<FlutterColorfulSearchingExample> createState() => _FlutterColorfulSearchingExampleState();
}

class _FlutterColorfulSearchingExampleState extends State<FlutterColorfulSearchingExample> {
  final List<String> items = [
    'apple ',
    'banana',
    'grape fruit',
    'dragon fruit',
    'pineapple',
    'blueberry',
    'blackberry',
    'kiwi fruit',
    'guava',
    'watermelon',
    'papaya',
    'orange',
    'lychee',
    'mango tango',
    'peach',
    'plum',
    'strawberry',
    'apple cinnamon',
    'lemon lime',
    'cherry blast',
    'coconut',
    'passion fruit',
    'star fruit',
  ];

  String searchTerm = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: const Text('Flutter Colorful Search Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
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
                itemCount: items.where((item) => item.toLowerCase().contains(searchTerm)).length,
                itemBuilder: (context, index) {
                  final filteredItems = items.where((item) => item.toLowerCase().contains(searchTerm)).toList();
                  return Card(
                    child: ListTile(
                      title: FlutterColorfulSearch(
                        listItem:  filteredItems[index],
                        searchText: searchTerm,
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