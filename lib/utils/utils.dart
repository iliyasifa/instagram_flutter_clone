import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<Uint8List?> pickImage(ImageSource source) async {
  ImagePicker imagePicker = ImagePicker();

  final XFile? xFile = await imagePicker.pickImage(
    source: source,
  );

  if (xFile != null) {
    return xFile.readAsBytes();
  }

  debugPrint('no image is selected');
  return null;
}

void showSnackBar({
  required String content,
  required BuildContext ctx,
}) {
  ScaffoldMessenger.of(ctx)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(content: Text(content)),
    );
}
