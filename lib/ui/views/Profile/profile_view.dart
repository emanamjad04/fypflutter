import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sosansheaven/ui/common/app_colors.dart';
import 'package:sosansheaven/ui/views/Sessions/session_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: IconButton(
              icon: Image.asset(
                'assets/images/greyMenuIcon.png',
                height: 25.h,
              ),
              onPressed: () {
                print('Menu icon pressed');
              },
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SessionView(),
            ),
          );
        },
        child: Stack(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                CircleAvatar(
                  radius: 50.r,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/images/person.png',
                    height: 50.h,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Zyn Alif',
                  style: TextStyle(
                    color: Light,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.h),
                Expanded(
                  child: ListView(
                    children: [
                      _buildMenuItem('Home', 'assets/images/home.png'),
                      _buildMenuItem('Progress', 'assets/images/progress.png'),
                      _buildMenuItem(
                          'Schedule Meeting', 'assets/images/schedule.png'),
                      _buildMenuItem(
                          'Training Sessions', 'assets/images/progress.png'),
                      SizedBox(height: 20.h),
                      // Signout
                      Center(
                        child: Text(
                          'Signout',
                          style: TextStyle(
                            color: Light,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, String iconPath) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 50.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                iconPath,
                height: 25.h,
                width: 25.w,
                color: Light,
              ),
              SizedBox(width: 5.w),
              Text(
                title,
                style: TextStyle(
                  color: Light,
                  fontSize: 8.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: Image.asset(
              'assets/images/hrLine.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
