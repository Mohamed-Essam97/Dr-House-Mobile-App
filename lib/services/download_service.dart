import 'package:dio/dio.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

class DownloadService {
  DownloadService() {}

  static Future<void> downloadFile(
      String url, String fileName, Function(double) onProgress) async {
    try {
      // Get a writable directory (temporary or documents directory)
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';

      final dio = Dio();
      await dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            // Calculate progress percentage and call onProgress function
            double progress = (received / total * 100);
            onProgress(progress);
          }
        },
      );

      print('File downloaded to $filePath');
    } catch (e) {
      print('Download failed: $e');
    }
  }

  static Future<void> downloadToGallery(
      String imageUrl, String fileName, Function(double) onProgress) async {
    // Check permissions for both Android and iOS
    await _requestPermissions();

    // Download the image using Dio
    Dio dio = Dio();
    try {
      var response = await dio.get(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
        onReceiveProgress: (received, total) {
          if (total != -1) {
            onProgress(received / total);
          }
        },
      );

      // Save image to gallery
      // final result = await ImageGallerySaver.saveImage(
      //   Uint8List.fromList(response.data),
      //   name: fileName,
      // );

      // if (result['isSuccess']) {
      //   print('Image saved to gallery');
      // } else {
      //   print('Failed to save image');
      // }
    } catch (e) {
      print('Error downloading image: $e');
    }
  }

  // Request necessary permissions
  static Future<void> _requestPermissions() async {
    // if (await Permission.storage.request().isGranted) {
    //   // Permission granted
    //   return;
    // }

    // if (await Permission.photos.request().isGranted) {
    //   // Permission granted for iOS photos
    //   return;
    // }
  }
}
