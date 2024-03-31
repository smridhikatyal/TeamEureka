import 'dart:convert';

import 'package:http/http.dart' as http;

Future<dynamic> sendDataToAPI(String url, Map<String, dynamic> data) async {
  try {
    // Convert data to JSON string
    String jsonData = jsonEncode(data);

    // Make POST request to API
    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonData,
    );

    // Check if request was successful (status code 200)
    if (response.statusCode == 200) {
      // Decode response data
      return jsonDecode(response.body);
    } else {
      // Handle other status codes (e.g., display error message)
      return 'Error: ${response.statusCode}';
    }
  } catch (e) {
    // Handle any errors that occur during the API call
    return 'Error: $e';
  }
}
