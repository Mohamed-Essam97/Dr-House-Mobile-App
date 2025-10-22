import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  LogoWidget({
    super.key,
    this.size,
  });

  double? size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'Assets.logo.whiteLogoJW.path',
      width: size,
    );
  }
}
