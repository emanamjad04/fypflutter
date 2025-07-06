import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sosansheaven/ui/login/login_view.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../common/app_colors.dart';

class ReusableForm extends StatelessWidget {
  final String title;
  final Function(String, String, String, String) onSubmit;

  const ReusableForm({
    Key? key,
    required this.title,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firstNameController = TextEditingController();
    final _lastNameController = TextEditingController();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20.h),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _firstNameController,
                style: TextStyle(
                  color: SecondaryLight,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: 'First Name',
                  hintStyle: TextStyle(
                    color: SecondaryLight,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: TextField(
                controller: _lastNameController,
                style: TextStyle(
                  color: SecondaryLight,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: 'Last Name',
                  hintStyle: TextStyle(
                    color: SecondaryLight,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        TextField(
          controller: _emailController,
          style: TextStyle(
            color: SecondaryLight,
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: 'Email',
            hintStyle: TextStyle(
              color: SecondaryLight,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        TextField(
          controller: _passwordController,
          style: TextStyle(
            color: SecondaryLight,
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(
              color: SecondaryLight,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        ElevatedButton(
          onPressed: () {
            onSubmit(
              _firstNameController.text,
              _lastNameController.text,
              _emailController.text,
              _passwordController.text,
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.symmetric(vertical: 15.h),
          ),
          child: Center(
            child: Text(
              'Create Account',
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: BackgroundColor,
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.symmetric(vertical: 15.h),
            elevation: 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'google.png',
                // width: 20.w,
                // height: 20.h,
              ),
              SizedBox(width: 5.w),
              Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Row(
          children: [
            Text(
              'Already have an account?',
              style: TextStyle(
                fontSize: 5.sp,
                fontWeight: FontWeight.w300,
                color: SecondaryLight,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInView()));
              },
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 5.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
