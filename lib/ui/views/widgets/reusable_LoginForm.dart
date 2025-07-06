import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sosansheaven/ui/login/login_view.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../common/app_colors.dart';

class ReusableLoginForm extends StatelessWidget {
  final String title;

  final Function(String, String) onSubmit;
  final Function() onSubmitGoogle;


  const ReusableLoginForm({
    Key? key,
    required this.title,
    required this.onSubmit,
    required this.onSubmitGoogle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final bool type ;
    ScreenUtil.init(context, designSize: const Size(1272, 676));

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

        TextField(
          controller: _emailController,
          style: TextStyle(
            color: SecondaryLight,
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: 'username',
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
          obscureText: true,
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
        SizedBox(height: 70.h),

        ElevatedButton(
          onPressed: () {
            onSubmit(
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
              'Login',
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: BackgroundColor,
              ),
            ),
          ),
        ),

        SizedBox(height: 20.h),

           ElevatedButton(
             onPressed:(){
               onSubmitGoogle();
             } ,
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
                    'Login with Google',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),


        SizedBox(height: 10.h),

        Row(
          children: [
            Text(
              'Dont have an account?',
              style: TextStyle(
                fontSize: 5.sp,
                fontWeight: FontWeight.w300,
                color: SecondaryLight,
              ),
            ),
            SizedBox(width: 5),
            GestureDetector(
              onTap: () {
                // final navigationService = locator<NavigationService>();
                // navigationService.navigateToLogInView();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInView()));
              },
              child: Text(
                'Create account',
                style: TextStyle(
                  fontSize: 5.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
