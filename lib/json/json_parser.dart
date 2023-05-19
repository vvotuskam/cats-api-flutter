import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:maksut_turganov_it2_2004_03_05_2023/models/cat.dart';

class JsonParser {
  final String baseUrl = "https://catfact.ninja/breeds";

  // add generics to Future
  Future<List<Cat>> fetchAll() async {
    List<Cat> cats = [];
    String url = baseUrl;
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonMap = json.decode(response.body);
      var data = jsonMap['data'];
      cats = data.map<Cat>((json) => Cat.fromJson(json)).toList().cast<Cat>();
      print(cats);
    }

    return cats;

  }
}