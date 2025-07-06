import 'package:flutter/material.dart';

import 'package:sosansheaven/ui/admin/meetings/meetings_viewmodel.dart';
import 'package:sosansheaven/ui/admin/users/users_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';

class UsersView extends StackedView<UsersViewmodel> {
  const UsersView({Key? key}) : super(key: key);


  @override
  Widget builder(
      BuildContext context,
      UsersViewmodel viewModel,
      Widget? child,
      ) {
    final _donorController = TextEditingController();
    final _orphanController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'Users Management',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _donorController,
              style: TextStyle(
                color: SecondaryLight,
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: 'donor',
                hintStyle: TextStyle(
                  color: SecondaryLight,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            TextField(
              controller: _orphanController,
              style: TextStyle(
                color: SecondaryLight,
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: 'orphan',
                hintStyle: TextStyle(
                  color: SecondaryLight,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                viewModel.addOrphanToDonor(
                  _orphanController.text,
                  _donorController.text,
                );
                _donorController.clear();
                _orphanController.clear();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Center(
                child: Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: BackgroundColor,
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );

  }
  @override
  UsersViewmodel viewModelBuilder(
      BuildContext context,
      ) =>
      UsersViewmodel();
}