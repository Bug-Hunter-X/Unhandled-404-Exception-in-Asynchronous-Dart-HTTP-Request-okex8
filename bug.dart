```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Correctly handle the JSON response
      final jsonResponse = jsonDecode(response.body);
      // Process jsonResponse
    } else {
      // Handle error responses other than 404
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    // Handle exceptions including 404
    if (e is SocketException) {
      print('Network error: $e');
    } else if (e is FormatException) {
      print('Invalid JSON format: $e');
    } else {
      print('An unexpected error occurred: $e');
    }
    //Specific 404 handling
    if (e.toString().contains("404")){
      print("Resource not found");
    }
  }
}
```