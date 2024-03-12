import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductItemGridWidget extends StatelessWidget {
  const CustomProductItemGridWidget({
    Key? key,
    required this.size,
    required this.height,
    required this.width,
    required this.content,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.imagePath,
  }) : super(key: key);

  final Size size;
  final double height;
  final double width;
  final String content;
  final String price;
  final String oldPrice;
  final String discount;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.12,
      width: size.width * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        // color: appGreen
        color: Colors.amber,
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: height,

                  //  size.height * 0.2,
                  width: width,
                  //  size.width * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    // image: DecorationImage(
                    //     image: AssetImage(imagePath), fit: BoxFit.contain),
                    color: Colors.white,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.fitHeight,
                      height: size.height * 0.15,
                      width: size.width * 0.7,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
