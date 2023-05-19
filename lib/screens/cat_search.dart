import 'package:flutter/material.dart';

import '../models/cat.dart';

class CatSearchPage extends StatefulWidget {
  Future<List<Cat>> futureCats;

  CatSearchPage({required this.futureCats});

  @override
  State<CatSearchPage> createState() => _CatSearchPageState();
}

class _CatSearchPageState extends State<CatSearchPage> {

  TextEditingController searchTextController = TextEditingController();
  String _searchTerm = '';

  List<Cat> filterCats(List<Cat> allCats, String term) {
    return allCats
        .where((cat) => cat.breed!.toLowerCase().contains(term.toLowerCase()))
        .toList()
    ;
  }

  Widget listViewWidget(List<Cat> cats) {
    return ListView.builder(
        itemCount: cats.length,
        padding: const EdgeInsets.all(2.0),
        itemBuilder: (context, position) {
          return customCard(cats[position]);
        });
  }

  // Widget customCard(Cat cat) {
  //   return Text(cat.breed!);
  // }

  Widget customCard(Cat cat) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          cat.breed!,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }


  Widget listBuilder() {
    return FutureBuilder<List<Cat>>(
      future: widget.futureCats,
      builder: (context, snapshot) {
        return snapshot.data != null
            ? listViewWidget(filterCats(snapshot.data!, _searchTerm))
            : const Center(child: CircularProgressIndicator());
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // search bar
          TextField(
            controller: searchTextController,
            onChanged: (value) {
              setState(() {
                _searchTerm = value;
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _searchTerm = '';
                  searchTextController.text = '';
                });
              },
              child: const Text("Reset")
          ),
          Expanded(child: listBuilder()),
        ],
      ),
    );
  }
}
