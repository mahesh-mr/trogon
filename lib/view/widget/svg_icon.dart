import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit fit;
  final bool isAlwaysWhite;
  final Color? fixedColor;

  const SvgIcon(
      {super.key,
      required this.path,
      this.fit = BoxFit.cover,
      this.height,
      this.width,
      this.color,
      this.isAlwaysWhite = false,
      this.fixedColor});
  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<ThemeProvider>(context);
    return SvgPicture.asset(
      'assets/$path.svg',
      height: height,
      width: width,
      fit: fit,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(Colors.white, BlendMode.srcIn),
    );
  }
}
