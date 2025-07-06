import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sosansheaven/ui/common/app_colors.dart';
import 'package:sosansheaven/ui/views/Home3/home3_view.dart';

class Home2View extends StatelessWidget {
  const Home2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: Container(
          color: BackgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 60.h,
                    width: 60.w,
                  ),
                  SizedBox(width: 90.w),
                  Center(
                    child: Text(
                      'Training Sessions',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: Secondary,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/bellIcon.png',
                    height: 30.h,
                    color: Secondary,
                  ),
                  SizedBox(width: 5.w),
                  Image.asset(
                    'assets/images/menu.png',
                    height: 20.h,
                    color: Secondary,
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Home3View()),
          );
        },
        child: Stack(
          children: [
            Container(
              color: BackgroundColor,
            ),
            Positioned(
              top: 200.h,
              left: -40.w,
              child: Image.asset(
                'assets/images/book.png',
                height: 400.h,
                width: 150.w,
              ),
            ),
            Positioned(
              top: 10.h,
              right: 10.w,
              child: Image.asset(
                'assets/images/book.png',
                height: 350.h,
              ),
            ),
            Positioned(
              top: 400.h,
              right: -10.w,
              child: Image.asset(
                'assets/images/book.png',
                height: 350.h,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.only(top: 60.h, left: 145.w),
                    child: Column(
                      children: [
                        Text(
                          'EMPOWER ORPHANS THROUGH',
                          style: TextStyle(
                            fontSize: 6.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'EDUCATION',
                          style: TextStyle(
                            fontSize: 6.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(children: [
                    Padding(padding: EdgeInsets.only(left: 100.w)),
                    SizedBox(height: 20.h),
                    CircleAvatar(
                      radius: 40.r,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        'assets/images/person.png',
                        height: 50.h,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(padding: EdgeInsets.only(left: 10.w)),
                    Text(
                      'Alina Saad',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 5.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
