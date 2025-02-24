```dart
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      // Process jsonResponse
    } else if (response.statusCode == 404) {
      print('Resource not found (404)');
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  } on SocketException catch (e) {
    print('Network error: $e');
  } on FormatException catch (e) {
    print('Invalid JSON format: $e');
  } on Exception catch (e) {
    print('An unexpected error occurred: $e');
  }
}
```