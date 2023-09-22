import 'package:flutter/material.dart';
import 'package:flutter_practical/src/constants/const_colors.dart';
import 'package:flutter_practical/src/constants/const_strings.dart';
import 'package:flutter_practical/src/constants/custom_text.dart';
import 'package:flutter_practical/src/models/UserList.dart';
import 'package:flutter_practical/src/views/user_list/user_detail_screen.dart';

// ignore: must_be_immutable
class UserListItem extends StatelessWidget {
  UserListItem(this.userList, {super.key});

  final List<Users> userList;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // Sort by the value of pos
    userList.sort((e1, e2) => Comparable.compare(e1.ssn!, e2.ssn!));

    return ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final user = userList[index];
          return _itemView(user, context);
        });
  }

  Widget _itemView(Users user, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>  UserDetailScreen(user)));
      },
      child: Card(
        color: ConstColors.colorWhite,
        shadowColor: ConstColors.colorLightGrey,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _loadImage(user.image!),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _spaces(),
                        CustomText(
                          title:
                              "${user.lastName} ${user.firstName} ${user.maidenName}",
                          color: ConstColors.colorBlack,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        _spaces(),
                        CustomText(
                          title: "${user.email}",
                          color: ConstColors.colorGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        _spaces(),
                        CustomText(
                          title: "${ConstStrings.ssn}: ${user.ssn}",
                          color: ConstColors.colorBlack,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                        _spaces(),
                        CustomText(
                          title:
                              "${ConstStrings.address}: ${user.address!.address}, ${user.address!.city}, ${user.address!.postalCode}",
                          maxLine: 2,
                          color: ConstColors.colorBlack,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: ConstColors.colorBlack,
                    size: 30.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _spaces() {
    return const SizedBox(height: 5);
  }

  Widget _loadImage(String image) {
    return Image.network(
      image,
      height: 100,
      width: 100,
      fit: BoxFit.cover,
    );
  }
}
