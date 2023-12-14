import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_modul6/ApiService.dart';
import 'package:latihan_modul6/Posts.dart';

void main() {
  test('Fetch Posts Test', () async {
    final client = http.Client(); // Definisikan variabel client
    final posts = await fetchPosts(client); // Gunakan variabel client saat memanggil fetchPosts
    expect(posts, isA<Posts>());
    expect(posts.userId, isNotNull);
    expect(posts.id, isNotNull);
    expect(posts.title, isNotNull);
    expect(posts.body, isNotNull);
  });

  test('Fetch Posts Error Test', () async {
    final client = http.Client();

    try {
      await fetchPosts(client);
      // Jika pemanggilan fetchPosts tidak melemparkan exception, maka test akan gagal
      fail('Exception expected but none was thrown');
    } catch (e) {
      expect(e, isInstanceOf<Exception>());
    }
  });

}
