import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sosansheaven/ui/common/app_colors.dart';

class SessionView extends StatelessWidget {
  const SessionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 30.w,
            ),
            child: IconButton(
              icon: Image.asset(
                'assets/images/grey_bell.png',
                height: 40.h,
              ),
              onPressed: () {
                print('Bell icon pressed');
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 450.h,
            left: -50.w,
            child: Image.asset(
              'assets/images/blackbookLeft.png',
              height: 400.h,
              width: 150.w,
            ),
          ),
          Positioned(
            top: 10.h,
            right: -8.w,
            child: Image.asset(
              'assets/images/blackbookRight.png',
              height: 350.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: ListView(
              children: [
                _buildSessionCard(
                  title: 'Training session 1 uploaded',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                ),
                _buildDivider(),
                _buildSessionCard(
                  title: 'Meeting scheduled',
                  description: '2pm PST , Meeting link is sent to your email.',
                ),
                _buildDivider(),
                _buildSessionCard(
                  title: 'Training session 2 uploaded',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSessionCard(
      {required String title, required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Light,
            fontSize: 8.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          description,
          style: TextStyle(
            color: Colors.white,
            fontSize: 6.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Image.asset(
            'assets/images/hrbig.png',
          ),
        ),
      ),
    );
  }
}
