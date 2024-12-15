import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_visitor/constant/color_manager.dart';
import 'package:qr_visitor/presentation/widgest/date_picker_field.dart';
import 'package:qr_visitor/presentation/widgest/form_input.dart';
import 'package:qr_visitor/presentation/widgest/time_picker_field.dart';

import 'visitor_qr_code_page.dart';

class VisitorFormPage extends StatefulWidget {
  const VisitorFormPage({super.key});

  @override
  _VisitorFormPageState createState() => _VisitorFormPageState();
}

class _VisitorFormPageState extends State<VisitorFormPage> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            bottom: 650.h,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/background.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Container(
                  color: Colors.black.withOpacity(0.75),
                ),
              ],
            ),
          ),
          Column(

            children: [
              Expanded(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 2.654,
                  child: SizedBox(
                    height: 162.h,
                    child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'New Visitor Pre-Access',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontFamily: 'NeueHaasDisplayBlack',
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'Villa 45, Palm Crescent Compound, Al Sufouh 2',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16.sp,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),


                  ),
              ),

              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorManager.backgroundFormColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(80.r)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.r,
                        offset: Offset(0, 4.h),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 43.w, vertical: 12.h),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.only( bottom: 23.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Visitor Info',
                                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '* ',
                                    style: TextStyle(fontSize: 14.sp, color: ColorManager.primaryColor),
                                  ),
                                  Text(
                                    'Required Field',
                                    style: TextStyle(fontSize: 12.sp, color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        buildTextField('Name ', 'Enter your name', 'assets/icons/person.svg', 24, 24, ColorManager.primaryColor,inputType: TextInputType.name),
                        SizedBox(height: 10.h),
                        buildTextField('Phone ', 'Enter your phone number', 'assets/icons/phone.svg', 24, 24, ColorManager.primaryColor,inputType: TextInputType.phone),
                        SizedBox(height: 10.h),
                        buildTextField('Email ', 'Enter your email', 'assets/icons/mail.svg', 20, 16, ColorManager.primaryColor,inputType: TextInputType.emailAddress),
                        SizedBox(height: 10.h),
                        const DatePicker(),
                        SizedBox(height: 10.h),
                        const TimePicker(),
                        SizedBox(height: 10.h),
                        buildTextField('ID Number ', 'Enter your ID number', 'assets/icons/contact.svg', 24, 17.6, ColorManager.primaryColor,inputType: TextInputType.number),
                        SizedBox(height: 10.h),
                        buildTextField('Visit Reason ', 'Enter your visit reason', 'assets/icons/comment.svg', 20, 20, ColorManager.primaryColor, isLarge: true),
                        SizedBox(height: 20.h),
                        Container(
                          height: 60.h,
                          width: 344.w,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [ColorManager.secondaryColor, ColorManager.primaryColor],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const VisitorQRCodePage()));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill all fields correctly.')));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(horizontal: 32.w),
                            ),
                            child: GestureDetector(
                              child: Row(
                                children: [
                                  Text(
                                    'Next Step',
                                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: 36.w,
                                    height: 36.h,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(36),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/icons/arrow.svg',
                                        width: 8.86,
                                        height: 11.14,
                                       color: Colors.white,

                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )

            ],
          ),
        ],
      ),
    );
  }




}
