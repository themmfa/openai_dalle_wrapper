import 'package:openai_dalle_wrapper/openai_dalle_wrapper.dart';

void main() async {
  final openai = OpenaiDalleWrapper(
    apiKey: "apiKey",
  );
  final imagepath = await openai.generateImage("an astronout riding horse");
  print(imagepath);
}
