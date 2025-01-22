import 'package:flutter/material.dart';
import 'package:scootly_customer/core/constants/colors.dart';
import 'package:scootly_customer/core/constants/sizes.dart';
import 'package:scootly_customer/presentation/screens/auth/SignIn_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOutCnfrmBottomSheet extends StatelessWidget {
  const LogOutCnfrmBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: getWidth(context),
        height: getHeight(context) * 0.234,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 37,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Are You sure You want to log out',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    color: AppColor.black),
              ),
              const SizedBox(
                height: 5,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      SharedPreferences prefs;
                      prefs = await SharedPreferences.getInstance();
                      prefs.setString('TOKEN', '');

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SigninPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.green,
                        fixedSize: Size(getWidth(context) * 0.4, 43),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6))),
                    child: Text(
                      'Yes',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: AppColor.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.black,
                        fixedSize: Size(getWidth(context) * 0.4, 43),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6))),
                    child: Text(
                      'No',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: AppColor.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
