import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';

class MeetingsViewmodel extends BaseViewModel {
  List<dynamic> _meetings = [];
  List<dynamic> get meetings => _meetings;

  bool _isbusy = false;
  bool get isbusy => _isbusy;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> fetchMeetings() async{
    _isbusy = true;
    notifyListeners();
    try{
      var response = await http.get(Uri.parse('http://127.0.0.1:8000/meetings/'),
        headers: {
          "Authorization": "TOKEN a8a6d0159cb1571212d62a2a7d01ded104af9262",
        }
      );

      if(response.statusCode == 200){
        print(response.body);
        _meetings =jsonDecode(response.body);
        _errorMessage = '';
      }
      else{
        _errorMessage = 'Failed to fetch meetings: ${response.statusCode}';
      }
    }
    catch(e){
      _errorMessage = 'Failed to fetch meetings: $e';
      notifyListeners();
    }

    _isbusy = false;
    notifyListeners();
  }

  Future<void> updateMeetingStatus(id,status) async{
    try{
      var response = await http.patch(Uri.parse('http://127.0.0.1:8000/meetings/${id}/'),
      headers: {
        "Authorization": "TOKEN a8a6d0159cb1571212d62a2a7d01ded104af9262",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "status": status
      }));
      if(response.statusCode == 200){
        print('Meeting status updated successfully');
        int index =_meetings.indexWhere((m)=> m['id']==id);
        if(index!=-1){
          _meetings[index]['status'] = status;
          notifyListeners();
        }
      }
      else{
        print('Failed to update meeting status: ${response.statusCode}');
      }
    }
    catch(e){
      print('Error updating meeting status: $e');
    }
  }
}