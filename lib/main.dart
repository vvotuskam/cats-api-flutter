//--no-sound-null-safety

import 'package:flutter/material.dart';
import 'package:maksut_turganov_it2_2004_03_05_2023/json/json_parser.dart';
import 'package:maksut_turganov_it2_2004_03_05_2023/screens/cat_info.dart';
import 'package:maksut_turganov_it2_2004_03_05_2023/screens/cat_search.dart';
import 'package:maksut_turganov_it2_2004_03_05_2023/splash.dart';

import 'models/cat.dart';

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
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Widget> _pages = [];
  int _selectedIndex = 0;
  JsonParser jsonParser = JsonParser();

  void _navigate(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  void initState() {
    super.initState();

    Future<List<Cat>> futureCats = jsonParser.fetchAll();

    _pages = [
      CatInfoPage(futureCats: futureCats,),
      CatSearchPage(futureCats: futureCats,)
    ];
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Cats'),
          elevation: 0,
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _navigate,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          ],
        ),
      ),
    );
  }
}
