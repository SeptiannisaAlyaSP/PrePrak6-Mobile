import 'package:flutter/material.dart';
import 'package:latihan_modul6/ApiService.dart';
import 'package:latihan_modul6/Posts.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final client = http.Client();
    return MaterialApp(
      title: 'Posts App',
      home:
      Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
        ),
        body: Center(
          child: FutureBuilder<Posts>(
            future: fetchPosts(client), // Panggil fetchPosts dengan client sebagai argumen
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('User ID: ${snapshot.data!.userId}'),
                    Text('ID: ${snapshot.data!.id}'),
                    Text('Title: ${snapshot.data!.title}'),
                    Text('Body: ${snapshot.data!.body}'),
                  ],
                );
              } else {
                return const Text('No Data');
              }
            },
          ),
        ),
      ),
    );
  }
}
