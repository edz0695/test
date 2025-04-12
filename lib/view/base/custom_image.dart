import 'package:cached_network_image/cached_network_image.dart';
import 'package:payapp/util/images.dart';
import 'package:flutter/material.dart'; // Use material.dart for broader widget support

// CustomImage is a widget for displaying images with a placeholder and error handling.
// It supports both network and local fallback images.
class CustomImage extends StatelessWidget {
  final String image; // URL of the network image to display
  final double? height; // Optional height of the image
  final double? width; // Optional width of the image
  final BoxFit? fit; // How the image should fit within its bounds

  final bool
      isNotification; // Flag to determine if this is for a notification image
  final String placeholder; // Custom placeholder image path, if needed
  const CustomImage({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.fit = BoxFit.cover, // Default fit is cover
    this.isNotification = false,
    this.placeholder =
        '', // Default is an empty string, will use a standard placeholder
  });

  // Builds the widget tree for CustomImage
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      height: height,
      width: width,
      fit: fit,
      errorWidget: (context, error, stackTrace) =>
          _buildPlaceholderOrErrorImage(),
      placeholder: (context, url) => _buildPlaceholderOrErrorImage(),
    );
  }

  // Helper method to build the placeholder or error image to avoid code duplication
  Widget _buildPlaceholderOrErrorImage() {
    String assetPath = placeholder.isNotEmpty
        ? placeholder
        : isNotification
            ? Images.notificationPlaceholder
            : Images.placeholder;
    return Image.asset(
      assetPath,
      height: height,
      width: width,
      fit: fit,
    );
  }
}
