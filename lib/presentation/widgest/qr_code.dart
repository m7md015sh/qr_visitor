import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QRCode extends StatelessWidget {
  const QRCode({super.key});

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      top: 289
          .h,
      child: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 0.8,
            colors: [
              Color(0x2CBBD233),
              Color(0x00157C8C),
            ],
          ),
        ),
        child: Image.asset(
          'assets/images/qr_code.png',
          width: 257.w,
          height: 257.w,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
