import 'package:flutter/material.dart';
import 'package:flutter_practical/src/constants/const_colors.dart';
import 'package:flutter_practical/src/constants/const_strings.dart';
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
          title: ConstStrings.userDetail,
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
                title: "${userDetail!.username}",
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
                height: 4,
              ),
              CustomText(
                title: "${ConstStrings.ssn}: ${userDetail!.ssn}",
                color: ConstColors.colorGrey,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
              const SizedBox(
                height: 20,
              ),
              _headerText(ConstStrings.personalDetail),
              _personalDetails(userDetail!),
              const SizedBox(
                height: 20,
              ),
              _headerText(ConstStrings.companyDetail),
              _companyDetails(userDetail!),
              const SizedBox(
                height: 20,
              ),
              _headerText(ConstStrings.bankDetail),
              _bankDetails(userDetail!),
            ],
          ),
        ),
      ),
    );
  }

// Bank details
  Widget _bankDetails(Users user) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 63, 27, 242),
              Color.fromARGB(255, 61, 27, 182),
              Color.fromARGB(255, 66, 68, 114),
              Color.fromARGB(255, 174, 157, 105),
            ],
          ),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bankCardText("${user.bank!.cardType}", 18),
          const Spacer(),
          _bankCardText("${user.bank!.iban}", 16),
          _bankCardText("${user.bank!.cardExpire}", 12),
          Row(
            children: [
              _bankCardText("${user.bank!.currency}", 22),
              const Spacer(),
              Stack(
                children: List.generate(
                  2,
                  (index) => Container(
                    margin: EdgeInsets.only(left: (15 * index).toDouble()),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white54),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _companyDetails(Users user) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: ConstColors.colorWhite,
        shadowColor: ConstColors.colorLightGrey,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _companyTextView(
              "${ConstStrings.department}: ${user.company!.department}",
            ),
            _companyTextView(
              "${ConstStrings.name}: ${user.company!.name}",
            ),
            _companyTextView(
              "${ConstStrings.title}: ${user.company!.title}",
            ),
            _companyTextView(
              "${ConstStrings.address}: ${user.company!.address!.address}, ${user.company!.address!.city}, ${user.company!.address!.state}, ${user.company!.address!.postalCode}",
            ),
          ],
        ),
      ),
    );
  }

  Widget _bankCardText(String label, double size) {
    return Text(label, style: TextStyle(fontSize: size, color: Colors.white));
  }

  Widget _headerText(String label) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CustomText(
          title: label,
          color: ConstColors.colorBlack,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _companyTextView(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
      child: CustomText(
        title: label,
        color: ConstColors.colorBlack,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget _personalDetails(Users user) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: ConstColors.colorWhite,
        shadowColor: ConstColors.colorLightGrey,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _companyTextView(
              "${ConstStrings.fullName}: ${user.firstName} ${user.maidenName} ${user.lastName}",
            ),
            _companyTextView(
              "${ConstStrings.gender}: ${user.gender}",
            ),
            _companyTextView(
              "${ConstStrings.phoneNumber}: ${user.phone}",
            ),
            _companyTextView(
              "${ConstStrings.birthDate}: ${user.birthDate}",
            ),
            _companyTextView(
              "${ConstStrings.age}: ${user.age}",
            ),
            _companyTextView(
              "${ConstStrings.address}: ${user.address!.address}, ${user.address!.city}, ${user.address!.state}, ${user.address!.city}",
            ),
            _companyTextView(
              "${ConstStrings.university}: ${user.university}",
            ),
            _companyTextView(
              "${ConstStrings.bloodGroup}: ${user.bloodGroup}",
            ),
            _companyTextView(
              "${ConstStrings.height}: ${user.height}   ${ConstStrings.weight}: ${user.weight}",
            ),
          ],
        ),
      ),
    );
  }
}
