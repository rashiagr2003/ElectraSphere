import 'package:flutter/material.dart';

class ClassSearchScreen extends StatefulWidget {
  @override
  _ClassSearchScreenState createState() => _ClassSearchScreenState();
}

class _ClassSearchScreenState extends State<ClassSearchScreen> {
  List<String> classMembers = [
    "John",
    "Great !",
    "Ő",
    "Edit",
    "Semester",
    "Emma",
    "Excited for the new Semester",
    "Alex",
    "Will discuss the upcoming",
    "Sophie",
    "Proposing changes for the",
    "Mark",
    "Semester",
    "Semester",
    "Celebrating the successful",
  ];

  List<String> filteredClassMembers = [];

  bool isSearching = false;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredClassMembers = classMembers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Class"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                isSearching = true;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (isSearching)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    filteredClassMembers = classMembers
                        .where((element) =>
                            element.toLowerCase().contains(value.toLowerCase()))
                        .toList();
                  });
                },
              ),
            ),
          if (filteredClassMembers.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: filteredClassMembers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredClassMembers[index]),
                    onTap: () {
                      // Handle class member selection
                    },
                  );
                },
              ),
            ),
          if (filteredClassMembers.isEmpty && isSearching)
            Center(
              child: Text("No results found"),
            ),
        ],
      ),
    );
  }
}
