import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class OpenaiDalleWrapper {
  static const _generationBaseUrl =
      'https://api.openai.com/v1/images/generations';
  static const _editBaseUrl = 'https://api.openai.com/v1/images/edits';
  final String apiKey;

  OpenaiDalleWrapper({
    required this.apiKey,
  });

  /// Function to generate image from text
  Future<String> generateImage(String text) async {
    final response = await http.post(
      Uri.parse(_generationBaseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: json.encode({
        'model': 'image-alpha-001',
        'prompt': text,
      }),
    );

    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      return data['data'][0]['url'];
    } else {
      throw Exception('$data["error"]["message"]');
    }
  }

  /// Function to edit an image with given text
  Future<List<dynamic>> editImage(
      String imagePath, String text, int numberOfVariations) async {
    final imageFile = File(imagePath);

    final headers = {'Authorization': 'Bearer $apiKey'};
    final request = http.MultipartRequest('POST', Uri.parse(_editBaseUrl));

    request.headers.addAll(headers);
    request.fields['model'] = 'image-alpha-001';
    request.fields['prompt'] = text;
    request.fields['num_images'] = '$numberOfVariations';
    request.fields['response_format'] = 'url';

    request.files.add(http.MultipartFile.fromBytes(
        'image', imageFile.readAsBytesSync(),
        filename: imageFile.path));

    final response = await request.send();
    final data = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final success = json.decode(data);
      return success['data'];
    } else {
      final error = json.decode(data);
      throw Exception(error["error"]["message"]);
    }
  }
}
