import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_visitor/constant/color_manager.dart';

Widget buildTextField(
    String label,
    String hint,
    String iconPath,
    double width,
    double height,
    Color iconColor, {
      bool isLarge = false,
      bool isEnable = true,
      bool isRequired = true,
      TextInputType inputType = TextInputType.text,
      TextEditingController? controller,
    }) {
  final focusNode = FocusNode();
  bool isValid = true;

  return StatefulBuilder(
    builder: (context, setState) {
      bool isFocused = focusNode.hasFocus;

      return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: isValid ? Colors.transparent : Colors.red,
                width: 1.r,
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.primaryColor.withOpacity(0.12),
                  spreadRadius: 0.5.r,
                  blurRadius: 8.r,
                  offset: const Offset(0, 0.1),
                ),
              ],
            ),
            child: TextFormField(
              controller: controller,
              focusNode: focusNode,
              enabled: isEnable,
              textAlignVertical: TextAlignVertical.bottom,
              maxLines: isLarge ? 4 : 1,
              keyboardType: inputType, // استخدام نوع الإدخال المحدد
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 12.sp),
                contentPadding: EdgeInsets.only(
                  top: isLarge ? 32.h : 32.h,
                  left: 50.w,
                  right: 16.w,
                  bottom: 8.h,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12.0.r),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              validator: (value) {
                if (isRequired && (value == null || value.isEmpty)) {
                  setState(() {
                    isValid = false;
                  });
                  return 'This field is required';
                }
                setState(() {
                  isValid = true;
                });
                return null;
              },
            ),
          ),
          Positioned(
            top: (isLarge ? 16.h : 18.h),
            left: 16.w,
            child: Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(
                iconPath,
                width: width.w,
                height: height.h,
                color: isValid ? iconColor : Colors.red,
              ),
            ),
          ),
          Positioned(
            top: isFocused ? -20.h : (isLarge ? 5.h : 8.h),
            left: 50.w,
            child: Row(
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.blackColor,
                  ),
                ),
                if (isRequired)
                  Text(
                    ' *',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.primaryColor,
                    ),
                  ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
