import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sosansheaven/app/app.bottomsheets.dart';
import 'package:sosansheaven/app/app.dialogs.dart';
import 'package:sosansheaven/app/app.locator.dart';
import 'package:sosansheaven/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  String meeting_email= '';
  String meeting_phone_no = '';

  void setMeetingDetails(String email, String phoneNo) {
    meeting_email = email;
    meeting_phone_no = phoneNo;
    notifyListeners();
  }

  Future<void> scheduleMeeting() async {
    try{
      var response = await http.post(Uri.parse('http://127.0.0.1:8000/meetings/create/'),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": meeting_email,
          "phone_no": meeting_phone_no,
          "status" : false
        })
      );

      if(response.statusCode ==200){
        Map<String, dynamic> jsonResponse = response.body.isNotEmpty ? jsonDecode(response.body) : {};
        String meetingId = jsonResponse['meeting_id'] ?? '';

        if (meetingId.isNotEmpty) {
          locator<DialogService>().showCustomDialog(
            variant: DialogType.infoAlert,
            title: 'Meeting Scheduled',
            description: 'Your meeting has been scheduled successfully with ID: $meetingId',
          );
        } else {
          locator<DialogService>().showCustomDialog(
            variant: DialogType.errorAlert,
            title: 'Error',
            description: 'Failed to schedule the meeting. Please try again.',
          );
        }
      }


    }
    catch (e) {
      print('Error scheduling meeting: $e');
    }
  }
  // final _dialogService = locator<DialogService>();
  // final _bottomSheetService = locator<BottomSheetService>();
  //
  // String get counterLabel => 'Counter is: $_counter';
  //
  // int _counter = 0;
  //
  //
  // void incrementCounter() {
  //   _counter++;
  //   rebuildUi();
  // }
  //
  // void showDialog() {
  //   _dialogService.showCustomDialog(
  //     variant: DialogType.infoAlert,
  //     title: 'Stacked Rocks!',
  //     description: 'Give stacked $_counter stars on Github',
  //   );
  // }
  //
  //
  // void showBottomSheet() {
  //   _bottomSheetService.showCustomSheet(
  //     variant: BottomSheetType.notice,
  //     title: ksHomeBottomSheetTitle,
  //     description: ksHomeBottomSheetDescription,
  //   );
  // }
}
