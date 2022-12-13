import 'package:openai_dalle_wrapper/openai_dalle_wrapper.dart';

void main() async {
  final openai = OpenaiDalleWrapper(
    apiKey: "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",
  );
  final imagepath = await openai.generateImage("an astronout riding horse");
  print(imagepath);
}
