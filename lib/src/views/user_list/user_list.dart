import 'package:flutter/material.dart';
import 'package:flutter_practical/src/view_models/user_view_model.dart';
import 'package:flutter_practical/src/views/user_list/user_list_item.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<StatefulWidget> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserViewModel>(context, listen: false).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UserViewModel>(context);
    return viewModel.userList != null && viewModel.userList!.users!.isNotEmpty
        ? UserListItem(viewModel.userList!.users!)
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
