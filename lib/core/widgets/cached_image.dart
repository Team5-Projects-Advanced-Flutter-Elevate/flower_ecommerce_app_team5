import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/loading_state_widget.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    required this.url,
    this.fit,
    this.width
    this.imageBuilder,
  });

  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  final String url;
  final BoxFit? fit;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      imageUrl: url,
      imageBuilder: imageBuilder,
      width: width,
      placeholder: (context, url) => const LoadingWidget(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
