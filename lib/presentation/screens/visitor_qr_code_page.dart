import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_visitor/presentation/widgest/qr_code.dart';
import 'package:qr_visitor/presentation/widgest/qr_code_actions.dart';
import 'package:qr_visitor/presentation/widgest/visitor_information.dart';

class VisitorQRCodePage extends StatelessWidget {
  const VisitorQRCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF182B42),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                child: Container(
                  height: 392.h,
                  width: 463.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Positioned(
                left: -23.w,
                top: 392.h,
                child: Container(
                  height: 550.h,
                  width: 476.w,
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.center,
                      radius: 1.3,
                      colors: [
                        Color(0x332CBBD2),
                        Color(0x00157C8C),
                      ],
                      stops: [0.1, 0.5],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 170.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Your Visitor QR Code",
                          style: TextStyle(
                            color: const Color(0xff2CBBD2),
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "was generated successfully!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.sp,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        const VisitorInformation(),
                        SizedBox(height: 16.h),
                        Text(
                          "Share this screen with your visitor so they can access it",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(height: 32.h),

                        const QrCodeActions(),
                      ],
                    ),
                  ),
                ),
              ),
              // QR CODE
             const QRCode(),
            ],
          ),
        ],
      ),
    );
  }
}



