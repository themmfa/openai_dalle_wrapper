import 'package:openai_dalle_wrapper/openai_dalle_wrapper.dart';

void main() async {
  final openai = OpenaiDalleWrapper(
    apiKey: "apiKey",
  );

  /// Generate image from text
  final imagepath = await openai.generateImage("an astronout riding horse");
  print(imagepath);

  /// Edit an image with given text
  final generatedImagesFromText = await openai.editImage(
      "/Users/fatiherdogan/Desktop/mine/openai_dalle_wrapper/lib/assets/images/cute_dog.png",
      "astronout dog",
      1);
  print(generatedImagesFromText);
}
