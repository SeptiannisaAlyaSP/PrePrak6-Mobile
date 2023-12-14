import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Posts.dart';

Future<Posts> fetchPosts(http.Client client) async {
  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

  if (response.statusCode == 200) {
    return Posts.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load posts');
  }
}