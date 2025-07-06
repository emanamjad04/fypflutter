import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../common/app_colors.dart';
import '../views/widgets/reusable_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 0.3.sw,
              height: double.infinity,
              color: Secondary,
              child: Stack(
                children: [
                  Positioned(
                    top: 30,
                    left: 0,
                    right: 80,
                    bottom: 30,
                    child: Image.asset(
                      'main.png',
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 20,
                    child: Image.asset(
                      'logolight.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 0.75.sw,
              decoration: BoxDecoration(
                color: BackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  bottomLeft: Radius.circular(30.r),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Image.asset(
                      'top.png',
                      width: 350,
                      height: 350,
                    ),
                  ),
                  Positioned(
                    bottom: -40,
                    left: 5,
                    child: Image.asset(
                      'bottom.png',
                      width: 350,
                      height: 350,
                    ),
                  ),
                  Positioned.fill(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.w, vertical: 20.w),
                      child: Center(
                        child: ReusableForm(
                          title: "Create Account",
                          onSubmit: (firstName, lastName, email, password) {
                            print("First Name: $firstName");
                            print("Last Name: $lastName");
                            print("Email: $email");
                            print("Password: $password");
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}