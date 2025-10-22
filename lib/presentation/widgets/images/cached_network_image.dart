import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:my_doctor_house_mobile_app/presentation/widgets/loading/loading_widget.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double width;
  final double height;
  final Widget? placeholderWidget;
  final Widget? errorWidget;

  const CachedNetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width = 50,
    this.height = 50,
    this.placeholderWidget,
    this.errorWidget,
  });

  Future<bool> _isSvg(String url) async {
    try {
      final response = await http.head(Uri.parse(url));
      return response.headers['content-type']?.contains('image/svg+xml') ??
          false;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isSvg(imageUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: height,
            child: placeholderWidget ??
                Center(
                    child: SizedBox(
                        width: 50, height: 50, child: LoadingWidget())),
          );
        }

        if (snapshot.hasError || !snapshot.hasData || !snapshot.data!) {
          return CachedNetworkImage(
            imageUrl: imageUrl,
            width: width,
            height: height,
            fit: fit,
            placeholder: (context, url) =>
                placeholderWidget ??
                Center(
                    child: SizedBox(
                        width: 50, height: 50, child: LoadingWidget())),
            errorWidget: (context, url, error) =>
                errorWidget ??
                const Center(child: Icon(Icons.error, color: Colors.red)),
          );
        }

        return SvgPicture.network(
          imageUrl,
          width: width,
          height: height,
          fit: fit,
          placeholderBuilder: (BuildContext context) =>
              placeholderWidget ??
              Center(
                  child:
                      SizedBox(width: 50, height: 50, child: LoadingWidget())),
        );
      },
    );
  }
}
