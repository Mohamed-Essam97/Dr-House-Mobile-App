import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

void main() async {
  // Create a picture recorder
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);

  // Define the gradient paint
  final paint = Paint()
    ..shader = ui.Gradient.linear(
      const Offset(0, 0),
      const Offset(1080, 1920), // Adjust size as needed
      [
        const Color(0xFF0188A4), // Start color
        const Color(0xFF1E334A), // End color
      ],
    );

  // Draw the gradient
  canvas.drawRect(
    const Rect.fromLTWH(0, 0, 1080, 1920), // Adjust size as needed
    paint,
  );

  // Convert to image
  final picture = recorder.endRecording();
  final img = await picture.toImage(1080, 1920); // Adjust size as needed
  final pngBytes = await img.toByteData(format: ui.ImageByteFormat.png);

  // Save the file
  final file = File('assets/splash_background.png');
  await file.writeAsBytes(pngBytes!.buffer.asUint8List());
}
