# OpenAI Dall*E2 Wrapper

OpenAI Dall*E2 Wrapper let's you generate AI generated images using open ai api endpoints.

## Installation 

1. Add the latest version of package to your pubspec.yaml (and run`dart pub get`):
```yaml
dependencies:
  openai_dalle_wrapper: ^0.0.1
```
2. Import the package and use it in your Flutter App.
```dart
import 'package:openai_dalle_wrapper/openai_dalle_wrapper.dart';
```

## Example

Get your api key from: https://beta.openai.com/account/api-keys

```dart
final open_ai = OpenaiDalleWrapper(
    apiKey: "$apiKey",
);

final imagePath = open_ai.generateImage("Your text to generate image from.")
```
