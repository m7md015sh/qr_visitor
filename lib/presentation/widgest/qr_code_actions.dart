import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QrCodeActions extends StatelessWidget {
  const QrCodeActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60.h,
          width: 330.w,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            gradient: LinearGradient(
              colors: [
                Color(0xFF157C8C),
                Color(0xFF2CBBD2),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Text(
              "Share This QR Code",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        TextButton(
          onPressed: () {},
          child: Text(
            "Back To Home",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }
}
