import 'package:flutter/material.dart';
import 'package:sosansheaven/ui/admin/main/admin_main_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';


class AdminMainView extends StackedView<AdminMainViewmodel> {
  const AdminMainView({Key? key}) : super(key: key);


  @override
  Widget builder(
      BuildContext context,
      AdminMainViewmodel viewModel,
      Widget? child,
      ) {
    return AdminScaffold(
      sideBar: SideBar(
        items: [
          AdminMenuItem(
            title: 'Meetings',
            route: 'meetings',
            icon: Icons.meeting_room,
          ),
         AdminMenuItem(
            title: 'Users',
            route: 'users',
            icon: Icons.people,
          ),

        ],

          onSelected: (item) {
            viewModel.screenselector(item.route);
          }, selectedRoute: viewModel.selectedroute,),
      body: viewModel.selectedScreen,
    );
  }
    @override
    AdminMainViewmodel viewModelBuilder(
        BuildContext context,
        ) =>
        AdminMainViewmodel();
  }