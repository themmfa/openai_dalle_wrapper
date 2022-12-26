# OpenAI Dall*E2 Wrapper

OpenAI Dall*E2 Wrapper let's you generate AI generated images using open ai api endpoints.

## Example

Get your api key from: https://beta.openai.com/account/api-keys

```dart
final open_ai = OpenaiDalleWrapper(
    apiKey: "$apiKey",
);
```

Generate Image from Text:

```dart
final imagePath = open_ai.generateImage("Your text to generate image from.")
```

Edit an image with given text:

```dart
final generatedImagesFromText = await openai.editImage(
       /// Image path
      "/Users/user/Desktop/mine/openai_dalle_wrapper/lib/assets/images/cute_dog.png",
      /// The text which api will generate edited image from
      "astronout dog",
      /// Number of variations to generate
      1,
      )
```
