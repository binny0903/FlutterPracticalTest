import 'package:flutter/material.dart';
import 'package:flutter_practical/src/constants/const_colors.dart';
import 'package:flutter_practical/src/constants/custom_text.dart';
import 'package:flutter_practical/src/models/UserList.dart';

// ignore: must_be_immutable
class UserDetailScreen extends StatefulWidget {
  UserDetailScreen(this.user, {super.key});

  Users? user;
  @override
  State<StatefulWidget> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetailScreen> {
  Users? userDetail;

  @override
  void initState() {
    super.initState();
    userDetail = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: ConstColors.colorWhite,
            )),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: ConstColors.colorWhite),
        backgroundColor: ConstColors.colorBlack,
        title: const CustomText(
          title: "User Detail",
          color: ConstColors.colorWhite,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        blurRadius: 8,
                        spreadRadius: 6,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: SizedBox(child: Image.network(userDetail!.image!)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomText(
                title: "${userDetail!.firstName} ${userDetail!.lastName}",
                color: ConstColors.colorBlack,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 4,
              ),
              CustomText(
                title: "${userDetail!.email}",
                color: ConstColors.colorGrey,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              const SizedBox(
                height: 5,
              ),
              Card(
                color: ConstColors.colorWhite,
                shadowColor: ConstColors.colorLightGrey,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  children: [
                    CustomText(
                      title: "Bank Details",
                      color: ConstColors.colorBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
