import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


import '../common/app_colors.dart';
import '../views/home/home_view.dart';
import '../views/widgets/reusable_LoginForm.dart';

class LogInView extends StatefulWidget {
  const LogInView({Key? key}) : super(key: key);

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {

  String firstName ="";
  String lastName ="";
  String uid="";
  String userEmail="";
  bool userType = true; // Default value

  Future<void> storeToken(String token,String firstname, String lastname) async{
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('token', token);
      prefs.setString('firstname', firstname);
      prefs.setString('lastname', token);
    });
  }

  Future<String?> getToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token;
  }
  Future<String?> getName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? first = prefs.getString('firstname');
    String? last = prefs.getString('lastname');
    String name =first!+" "+last!;
    return name;
  }

  Future<void>_sendUserDetailsToBackend(String uid, String? email, String? firstName, String lastName) async{
    try{
      print('adding user to django');

      var response =await http.post(Uri.parse('http://127.0.0.1:8000/signup/'),
        headers: {
          'Content-Type': 'application/json',
        },
          body: jsonEncode({
            "first_name": firstName,
            "last_name": lastName,
            "username": uid,
            "password": uid,
            "email": email,
            "profile": {
              "type": false
            }
          }),

          );

      if(response.statusCode == 200 || response.statusCode == 201){
        print('user added to django as well');
        print(jsonDecode(response.body));
        Map<String, dynamic> jsonToken = jsonDecode(response.body);
        Map<String,dynamic> jsonUser = jsonToken['user'];
        String token = jsonToken['token'];
        String firstname = jsonUser['first_name'];
        String lastname = jsonUser['last_name'];
        storeToken(token,firstname,lastname);
        print("token see$token" );
        print("firstname see$firstname" );
      }
      else{
        print('user not added to django');
        print(jsonDecode(response.body));

      }
    }catch(e){
      print(e);
    }

  }
  loginUser(String username, String password) async {
    try {
      var response = await http.post(Uri.parse('http://127.0.0.1:8000/login/'),
        body: {
          "username": username,
          "password": password,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Response Body: ${response.body}');
        print('Logged in successfully');
        Map<String, dynamic> jsonToken = jsonDecode(response.body);
        Map<String,dynamic> jsonUser = jsonToken['user'];
        String token = jsonToken['token'];
        String firstname = jsonUser['first_name'];
        String lastname = jsonUser['last_name'];
        storeToken(token,firstname!,lastname!);
        print("token see$token" );
        print("firstname see$firstname" );

      } else {
        print('Errorr: ${response.statusCode}, ${response.body}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  googleSignin() async{

    try {
      //257146771763-66krcu0s1vpg6jvik2iks4mfde6dh9ht.apps.googleusercontent.com
      GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: '257146771763-66krcu0s1vpg6jvik2iks4mfde6dh9ht.apps.googleusercontent.com',
      );
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        //create user as it is not present eman
        final GoogleSignInAuthentication googleAuth = await googleUser
            .authentication;

        //so new credential also
        final OAuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken
        );

        // sigin again

        final UserCredential userCredential = await FirebaseAuth.instance
            .signInWithCredential(credential);

        final User? user = userCredential.user;

        if (user != null) {
          final bool isNewUser = userCredential.additionalUserInfo!.isNewUser;
          final String uid = user.uid;
          final String? email = user.email;
          final String? displayName = user.displayName;
          final List<String> nameParts = displayName?.split(' ') ?? [];
          firstName=nameParts.first;
          lastName=nameParts.length > 1 ? nameParts.sublist(1).join(' '): ' ';

          if(isNewUser){
            await _sendUserDetailsToBackend(uid, email, firstName, lastName);
          }
          else{
            await loginUser(uid, uid);
          }

          print('adding user to django');
          print('Signed in as ${user.email}');
          print('Signed in as ${user.uid}');
          print('Signed in as ${user.displayName}');
        }
      }
    }
    catch(e, stackTrace) {
      print('Exception EMan: ');
      print(e);
      print('StackTrace: $stackTrace');
    }


  }




  @override
  Widget build(BuildContext context) {
        ScreenUtil.init(context, designSize: const Size(1272, 676));

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeView()),
        );
      },
      child: Scaffold(
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
                        'top.png',
                        width: 350,
                        height: 350,
                      ),
                    ),
                    Positioned.fill(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.w, vertical: 20.w),
                        child: Center(
                          child: ReusableLoginForm(
                            title: "Login",
                            onSubmit: (username, password) {
                              loginUser(username, password);
                              print("Email: $username");
                              print("Password: $password");
                            }, onSubmitGoogle: () {
                              googleSignin();
                              print("Google Sign-In clicked");
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
      ),
    );
  }
}
