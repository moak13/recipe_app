import 'package:flutter/material.dart';
import 'package:receipe_app/ui/common/app_images.dart';

class NoDishImage extends StatelessWidget {
  const NoDishImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.splashLogo,
      fit: BoxFit.contain,
    );
  }
}
