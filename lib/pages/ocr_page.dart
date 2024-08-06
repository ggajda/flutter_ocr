import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class OcrPage extends StatefulWidget {
  const OcrPage({super.key});

  @override
  State<OcrPage> createState() => _OcrPageState();
}

class _OcrPageState extends State<OcrPage> {
  String _ocrtxt = '';

  Future<void> _getImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(InputImage.fromFilePath(image!.path));

    setState(() {
      _ocrtxt = recognizedText.text;
    });

    // print(recognizedText.text);
// // Capture a photo.
//     final XFile? photo = await picker.pickImage(source: ImageSource.camera);
// // Pick a video.
//     final XFile? galleryVideo =
//         await picker.pickVideo(source: ImageSource.gallery);
// // Capture a video.
//     final XFile? cameraVideo =
//         await picker.pickVideo(source: ImageSource.camera);
// // Pick multiple images.
//     final List<XFile> images = await picker.pickMultiImage();
// // Pick singe image or video.
//     final XFile? media = await picker.pickMedia();
// // Pick multiple images and videos.
//     final List<XFile> medias = await picker.pickMultipleMedia();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('OCT page'),
      ),
      body: Center(child: Text(_ocrtxt)),
      floatingActionButton: FloatingActionButton(
          onPressed: _getImage,
          tooltip: 'Get image',
          child: const Icon(Icons.image_search)),
    );
  }
}
