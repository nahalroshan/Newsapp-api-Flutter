import 'dart:convert';

import 'package:fluttertechnews/components/searchbar.dart';
import 'package:fluttertechnews/utils/key.dart';
import 'package:http/http.dart' as http;

Future<List> fetchnews() async {
  final response = await http.get(
    Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=' +
        Key.key +
        '&q=' +
        Searchbar.searchcontroller.text),
  );
  Map result = jsonDecode(response.body);
  print('Fetched');
  print(Searchbar.searchcontroller.text);
  return (result['articles']);
}
