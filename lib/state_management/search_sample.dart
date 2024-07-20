import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Seach Demo",
      debugShowCheckedModeBanner: false,
      home: SearchSample(),
    );
  }
}

class SearchSample extends StatefulWidget {
  const SearchSample({super.key});

  @override
  State<SearchSample> createState() => _SearchSampleState();
}

class _SearchSampleState extends State<SearchSample> {
  // We first create a list of items to be searched
  List<String> items = [
    "Apple",
    "Banana",
    "Orange",
    "Mango",
    "Grapes",
    "Watermelon",
    "Pineapple",
    "Strawberry",
    "Cherry",
    "Lemon",
    "Peach",
    "Apricot",
    "Coconut",
    "Papaya",
    "Pear",
    "Jackfruit",
    "Kiwifruit",
    "Mandarin",
    "Papaya",
    "Durian",
    "Dragonfruit",
    "Quince",
  ];

// A list to hold the filtered items after the user types something
  List<String> filteredItems = [];

// Funciton to add the items to the filtered Items List
  void filterItems(String query) {
    setState(() {
      filteredItems = items.where((item) {
        return item.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

// INIT function to initialize the filtered items.
  @override
  void initState() {
    filteredItems = items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Page Functionality"),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            onChanged: filterItems,
            decoration: const InputDecoration(
                hintText: "Search Here", prefixIcon: Icon(Icons.search)),
            keyboardType: TextInputType.text,
          ),
          // This is where we list the items in the list
          Expanded(
              child: ListView.builder(
                  itemCount: filteredItems.length,
                  // Listing the items one by one
                  itemBuilder: (context, index) {
                    return ListTile(
                      // Using Textwidgets to display the items in the list which are texts
                      title: InkWell(
                        onTap: () {},
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Text(filteredItems[index])),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
