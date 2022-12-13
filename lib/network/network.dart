import 'dart:convert';

import 'package:http/http.dart' as http;

class OpenaiDalleWrapper {
  final _baseUrl = 'https://api.openai.com/v1/images/generations';
  final String apiKey;

  OpenaiDalleWrapper({
    required this.apiKey,
  });

  Future<String> generateImage(String text) async {
    final url = _baseUrl;
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: json.encode({
        'model': 'image-alpha-001',
        'prompt': text,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data'][0]['url'];
    } else {
      throw Exception('Failed to generate image');
    }
  }
}
