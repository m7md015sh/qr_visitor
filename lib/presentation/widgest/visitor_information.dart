import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VisitorInformation extends StatelessWidget {
   const VisitorInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return    Container(
      margin: EdgeInsets.symmetric(horizontal: 40.w),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: const Color(0xFF253A50),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF157C8C),
                    Color(0xFF2CBBD2),
                  ],
                ).createShader(bounds);
              },
              child: const Icon(
                Icons.person,
                color: Colors
                    .white,
                size: 24,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ahmed Ali Mostafa",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "13/12/2024 - 12:03 pm",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
