import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sosansheaven/ui/admin/main/admin_main_view.dart';
import 'package:sosansheaven/ui/views/widgets/apptext.dart';
import 'package:sosansheaven/ui/views/widgets/homepagecards.dart';
import 'package:stacked/stacked.dart';
import 'package:sosansheaven/ui/common/app_colors.dart';
import 'package:sosansheaven/ui/common/ui_helpers.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import '../widgets/topbarcontents.dart';
import 'home_viewmodel.dart';
import 'package:http/http.dart' as http;



class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);


  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    var ScreenSize = MediaQuery.of(context).size;

    String email= '';
    String phone_no = '';


    return Scaffold(

      backgroundColor: BackgroundColor,
      appBar: PreferredSize(

          preferredSize: Size(ScreenSize.width, 90),
          child: TopBarContents()
      ),
      body: FooterView(

          footer: Footer(
              backgroundColor: Secondary,
              child: Container(
            height: 400,
            color: Secondary,
            child:Column(
              spacing: 20,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminMainView()));
                    },
                    child: Apptext(text: 'About', color: Colors.white,size: 40,)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('whitelogo.png',height: 50,),
                    Column(
                      children: [
                        Apptext(text: 'Contact Us:',color: Colors.white,size: 20,),
                        Container(
                          padding: EdgeInsets.all(10),
                          width: 234,
                          height: 38,
                          decoration: BoxDecoration(
                            color: SecondaryLight,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Apptext(text: 'Type here',size: 11,),
                        )
                      ],
                    ),
                    Apptext(text: 'Follow Us:',color: Colors.white,size: 20,),
                  ],
                )
              ],
            ),
          )),

          children:[
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        height: 900,
                        child: Stack(
                          children: [
                            Positioned(
                              top:590,
                              left: (MediaQuery.of(context).size.width-1041)/2,
                              child: Container(
                                width: 1041,
                                height: 286,
                                decoration: BoxDecoration(
                                    color: SecondaryLight,
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30))
                                ),
                              ),),

                            Positioned(
                                right: 5,
                                top: 50,
                                child: Image.asset('assets/book.png', height: 340,)),
                            Positioned(
                                left: 5,
                                top: 300,
                                child: Image.asset('assets/book.png', height: 340,)),
                            Container(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 180,),
                                  Container(
                                    width: 890,
                                    child: Apptext(text: 'EMPOWER ORPHANS THROUGH EDUCATION',size: 40,textaligncenter: true,),
                                  ),
                                  SizedBox(height: 8,),
                                  Apptext(text: 'TOGETHER, WE CAN BRIGHTEN THE FUTURE',size: 17,),
                                  SizedBox(height: 20,),
                                  Container(
                                      width: 360,
                                      child: Apptext(text: 'Join Us Making A  Difference, every child deserves a chance to learn',size: 14,color: Secondary,)),
                                  SizedBox(height: 15,),
                                  ElevatedButton(
                                      onPressed: (){
                                        _showDialog(context,viewModel);
                                      },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Secondary,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8)
                                            )
                                        ),
                                       child: Apptext(text: 'Schedulle Meeting',size:13,color: Colors.white,)),

                                  SizedBox(height: 60),

                                  Row(
                                    spacing: 20,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Cards(text: 'Schedulle Meeting', image: 'Calender.png'),
                                      Cards(text: 'Donate', image: 'donate.png'),
                                      Cards(text: 'Check Progress', image: 'progress.png'),
                                    ],
                                  )
                                ],
                              ),
                            ),

                          ],
                        )
                    ),

                  ],
                ),
              ),
            ),
          ])
    );
  }


  Future<void> _showDialog(BuildContext context,HomeViewModel viewmodel) async{
    String tempemail = '';
    String tempphone_no = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Schedulle meeting'),
          content: Column(
            children: [
              TextField(
                decoration: InputDecoration(hintText: "Enter Your Email"),
                onChanged: (value) {
                  tempemail = value;
                },
              ),
              TextField(
                decoration: InputDecoration(hintText: "Enter Your Phone_no"),
                onChanged: (value) {
                  tempphone_no = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Send'),
              onPressed: () {
               viewmodel.setMeetingDetails(tempemail, tempphone_no);
               viewmodel.scheduleMeeting();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}


