import 'package:flutter/cupertino.dart';
import 'package:flutter_admin_scaffold/src/admin_menu_item.dart';
import 'package:sosansheaven/ui/admin/meetings/meetings_view.dart';
import 'package:sosansheaven/ui/admin/users/users_view.dart';
import 'package:stacked/stacked.dart';

class AdminMainViewmodel extends BaseViewModel {

  String _selectedroute = 'users';

  Map<String,Widget> screens = {
    'meetings':MeetingsView(),
    'users':UsersView(), // Placeholder for UsersView, replace with actual UsersView when implemented
  };

  String get selectedroute => _selectedroute;
  Widget get selectedScreen => screens[_selectedroute] ?? MeetingsView();

  void screenselector(route) {
    _selectedroute = route;
    notifyListeners();

  }

}
