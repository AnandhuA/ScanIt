import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:scan_it/app/theme/app_colors.dart';

class NetworkImageWithLoader extends StatelessWidget {
  final String imageUrl;
  final double height;
  final BoxFit fit;

  const NetworkImageWithLoader({
    super.key,
    required this.imageUrl,
    this.height = 200,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return _errorWidget();
    }

    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      fit: fit,

      //  Loader (SpinKit)
      placeholder: (context, url) {
        return SizedBox(
          height: height,
          child: Center(
            child: SpinKitThreeInOut(color: AppColors.white, size: 35),
          ),
        );
      },

      //  Error
      errorWidget: (context, url, error) {
        return _errorWidget();
      },

      //  Smooth fade
      fadeInDuration: const Duration(milliseconds: 300),
    );
  }

  Widget _errorWidget() {
    return SizedBox(
      height: height,
      child: const Center(
        child: Icon(Icons.broken_image, size: 60, color: Colors.grey),
      ),
    );
  }
}
