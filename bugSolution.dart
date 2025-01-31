```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        if (jsonData is Map && jsonData.containsKey('someKey')) {
          print(jsonData['someKey']);
        } else {
          print('Error: JSON data is invalid or missing someKey');
        }
      } catch (e) {
        print('Error decoding JSON: $e');
        rethrow; // Rethrow to handle the error appropriately further up
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching data: $e');
    rethrow; 
  }
}
```