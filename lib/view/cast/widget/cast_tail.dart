// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:trogon_task/config/colors.dart';
import 'package:trogon_task/config/fonts.dart';

class CastTail extends StatelessWidget {
  const CastTail({
    Key? key,
    required this.size,
    required this.images,
    required this.realNmae,
    required this.charetorName,
    required this.onTap,
  }) : super(key: key);

  final Size size;
  final String images;
  final String realNmae;
  final String charetorName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Container(
        height: size.height * 0.17,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: appWhiteshadeLight),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: SizedBox(
                height: size.height * 0.17,
                width: size.width * 0.3,
                child: Image.network(
                  images,
                  fit: BoxFit.fill,
                  // height: size.height * 0.15,
                  // width: size.width * 0.7,
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            Container(
              height: size.height * 0.17,
              width: size.width * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    realNmae,
                    style: white18W500,
                  ),
                  Text(
                    charetorName,
                    style: white16normal,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            IconButton(
              onPressed: onTap,
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 30.sp,
                color: appWhiteshade,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
