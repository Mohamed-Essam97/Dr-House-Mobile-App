import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FileService {
  Future<String> _getFileType(String url) async {
    try {
      final response = await Dio().head(url);
      return response.headers['content-type']?.first ??
          'application/octet-stream';
    } catch (e) {
      print('Error fetching file type: $e');
      return 'application/octet-stream';
    }
  }

  // Determine file type and return appropriate preview widget
  Future<Widget> filePreview(String attachment) async {
    final fileType = await _getFileType(attachment);

    if (fileType.contains('image')) {
      return Image.network(
        attachment,
        height: 150,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Icon(Icons.broken_image, size: 50, color: Colors.blue);
        },
      );
    } else {
      return Icon(Icons.attach_file, size: 50, color: Colors.blue);
    }
  }
}
