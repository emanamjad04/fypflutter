import 'package:sosansheaven/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

class UsersViewmodel extends BaseViewModel {

  Future<void> addOrphanToDonor(String orphanUsername , String donorUsername) async {

    try{
      var response = await http.post(Uri.parse("http://127.0.0.1:8000/orphan_to_donor_profile/"),
          headers: {
            "Authorization": "TOKEN a8a6d0159cb1571212d62a2a7d01ded104af9262",
          },
          body:{
            "donor_username": donorUsername,
            "orphan_username": orphanUsername
          },
          );
      if(response.statusCode == 200){
        print('Orphan added to donor successfully');
        Fluttertoast.showToast(
            backgroundColor: PrimaryColor,
            textColor: Secondary,
            toastLength: Toast.LENGTH_LONG,
            fontSize: 16,
            gravity: ToastGravity.CENTER,
            msg:'Successfully Added!'
        );
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        print('Response: $jsonResponse');
      } else {
        print('Failed to add orphan to donor: ${response.statusCode}');
        Fluttertoast.showToast(
            backgroundColor: PrimaryColor,
            textColor: Secondary,
            toastLength: Toast.LENGTH_LONG,
            fontSize: 16,
            gravity: ToastGravity.CENTER,
            msg:'Failed to Add!'
        );
        print('Response: ${response.body}');
      }
    }
    catch(e){
      print('Error adding orphan to donor: $e');
    }
  }
}