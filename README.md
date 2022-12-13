# OpenAI Dall*E2 Wrapper

OpenAI Dall*E2 Wrapper let's you generate AI generated images using open ai api endpoints.

## Example

Get your api key from: https://beta.openai.com/account/api-keys

```dart
final open_ai = OpenaiDalleWrapper(
    apiKey: "$apiKey",
);

final imagePath = open_ai.generateImage("Your text to generate image from.")
```
