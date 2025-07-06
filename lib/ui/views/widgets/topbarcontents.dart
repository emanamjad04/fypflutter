import 'package:flutter/material.dart';
import 'package:sosansheaven/ui/common/app_colors.dart';
import 'package:sosansheaven/ui/login/login_view.dart';

class TopBarContents extends StatefulWidget {


  const TopBarContents({
    Key? key,
  }) : super(key: key);

  @override
  State<TopBarContents> createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  List _ishover = [
    false,
    false,
    false,
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context).size;
    return Padding(padding: EdgeInsets.all(20),
        child: Expanded(child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SizedBox(width: MediaQuery.of(context).size.width/5,),
          Container(
            child: Image.asset('assets/logo.png',
            height: 99,),
          ),
          Row(
            children: [
              InkWell(
                onHover: (value){
                  setState(() {
                    value ? _ishover[0]=true:  _ishover[0]=false;
                  });
                },
                onTap: (){},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    SizedBox(height: 15,),
                    Text(
                      'Home',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        fontFamily: 'appfont'
                      ),
                    ),
                    SizedBox(height: 5,),
                    Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _ishover[0],
                        child: Container(
                          height: 2,
                          width: 20,
                          color: PrimaryColor,
                        ))
                  ],
                ),
              ),
              SizedBox(width: ScreenSize.width/21,),
              InkWell(
                onHover: (value){
                  setState(() {
                    value ? _ishover[1]=true: _ishover[1]=false;
                  });
                },
                onTap: (){},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    SizedBox(height: 15,),

                    Text(
                      'About',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'appfont'
                      ),
                    ),
                    SizedBox(height: 5,),
                    Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _ishover[1],
                        child: Container(
                          height: 2,
                          width: 20,
                          color: PrimaryColor,
                        ))
                  ],
                ),
              ),
              SizedBox(width: ScreenSize.width/21,),
              InkWell(
                onHover: (value){
                  setState(() {
                    value ? _ishover[2]=true: _ishover[2]= false;
                  });
                },
                onTap: (){},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    SizedBox(height: 15,),

                    Text(
                      'Blog',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'appfont'
                      ),
                    ),
                    SizedBox(height: 5,),
                    Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _ishover[2],
                        child: Container(
                          height: 2,
                          width: 20,
                          color: PrimaryColor,
                        ))
                  ],
                ),
              ),
              SizedBox(width: ScreenSize.width/21,),
              InkWell(
                onHover: (value){
                  setState(() {
                    value ? _ishover[3]=true: _ishover[3]=false;
                  });
                },
                onTap: (){},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15,),

                    Text(
                      'Contact',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'appfont'
                      ),
                    ),
                    SizedBox(height: 5,),
                    Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _ishover[3],
                        child: Container(
                          height: 2,
                          width: 20,
                          color: PrimaryColor,
                        ))
                  ],
                ),
              ),
              SizedBox(width: ScreenSize.width/20,),
              InkWell(
                onHover: (value) {
                  setState(() {
                    _ishover[4] = value;
                  });
                },
                onTap: () {},
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInView()));
                  },
                  child: Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _ishover[4] ? PrimaryColor : Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                            fontFamily: 'appfont'
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
    )),
    );
  }
}
