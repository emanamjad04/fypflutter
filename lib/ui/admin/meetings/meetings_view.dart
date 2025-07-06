import 'package:flutter/material.dart';

import 'package:sosansheaven/ui/admin/meetings/meetings_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MeetingsView extends StackedView<MeetingsViewmodel> {
  const MeetingsView({Key? key}) : super(key: key);


  @override
  Widget builder(
      BuildContext context,
      MeetingsViewmodel viewModel,
      Widget? child,
      ) {
    return Scaffold(
      body:
      viewModel.isbusy==true?
      Center(child: CircularProgressIndicator()): viewModel.errorMessage.isNotEmpty?
      Center(child: Text(viewModel.errorMessage)):
          viewModel.meetings.isEmpty? Text('No meetings available'):
        ListView.builder(
    itemCount: viewModel.meetings.length,
    itemBuilder: (BuildContext context , int index) {
      var meeting = viewModel.meetings[index];
        return ListTile(
          title: Text(meeting['email']?? 'no email'),
          subtitle: Text(meeting['phone_no']?? 'no phone number'),
          trailing: GestureDetector(
              onTap: (){
                viewModel.updateMeetingStatus(meeting['id'],!meeting['status']);
              },
              child: Text(meeting['status']==true?'Complete':'pending')),
          onTap: () {
            // Handle meeting tap
          },
        );
      },
    )
    );

  }
    @override
    MeetingsViewmodel viewModelBuilder(
        BuildContext context,
        ) =>
        MeetingsViewmodel();
  @override
  void onViewModelReady(MeetingsViewmodel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.fetchMeetings();
  }
  }