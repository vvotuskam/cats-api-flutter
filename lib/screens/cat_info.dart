import 'dart:math';

import 'package:flutter/material.dart';

import '../models/cat.dart';

class CatInfoPage extends StatefulWidget {
  Future<List<Cat>> futureCats;

  CatInfoPage({required this.futureCats});

  @override
  State<CatInfoPage> createState() => _CatInfoPageState();
}

class _CatInfoPageState extends State<CatInfoPage> {

  int index = -1;
  int max = -1;

  Widget catInfoWidget() {
    return FutureBuilder(
      future: widget.futureCats,
      builder: (context, snapshot) {
        max = snapshot.data!.length;
        if (index == -1) {
          return const Text("Hello, find cat!");
        }
        else if (snapshot.data == null) {
          return const CircularProgressIndicator();
        }
        else {
          Cat cat = snapshot.data![index];
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cat.breed ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Country: ${cat.country ?? ''}',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Origin: ${cat.origin ?? ''}',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Coat: ${cat.coat ?? ''}',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Pattern: ${cat.pattern ?? ''}',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 16.0),
              ],
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            catInfoWidget(),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  index = Random().nextInt(max);
                });
              },
              child: Text('Press me!'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  index = -1;
                });
              },
              child: Text('Reset'),
            ),
          ],
        ),
      )
    );
  }
}
