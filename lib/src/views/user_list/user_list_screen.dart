import 'package:flutter/material.dart';
import 'package:flutter_practical/src/constants/const_colors.dart';
import 'package:flutter_practical/src/constants/const_strings.dart';
import 'package:flutter_practical/src/constants/custom_text.dart';
import 'package:flutter_practical/src/view_models/user_view_model.dart';
import 'package:flutter_practical/src/views/user_list/user_list.dart';
import 'package:provider/provider.dart';

class UserListScreen extends StatefulWidget{
  const UserListScreen({super.key});

  @override
  State<StatefulWidget> createState() => _UserListScreenState();

}

class _UserListScreenState extends State<UserListScreen>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: AppBar(
      title: _appBarText(title : ConstStrings.userList),
      centerTitle: true,
      backgroundColor: ConstColors.colorBlack,
      titleTextStyle: const TextStyle(color: ConstColors.colorWhite),
    ),
    body: ChangeNotifierProvider(create: (context)=> UserViewModel(),
    child: const UserList(),),
    
   );
  }

  Widget _appBarText({String? title}){
    return CustomText(title :title!, fontSize: 20, fontWeight: FontWeight.bold, color: ConstColors.colorWhite,);
  }

}