import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoesly/utils/routes/app_assets_routes.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.placeHolderImage,
    this.height,
    this.width,
    this.fit,
  });
  final String imageUrl;
  final String? placeHolderImage;
  final double? height;
  final double? width;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: fit,
      progressIndicatorBuilder: (context, url, progress) => Image.asset(
        placeHolderImage ?? AppAssetsRoutes.shoesPath,
      ),
      errorWidget: (context, url, error) => Image.asset(
        placeHolderImage ?? AppAssetsRoutes.shoesPath,
      ),
    );
  }
}
