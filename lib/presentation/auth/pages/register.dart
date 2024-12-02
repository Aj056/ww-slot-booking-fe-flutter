import 'package:flutter/material.dart';
import 'package:ww_slot_booking_fe_flutter/common/widgets/appbar/app_bar.dart';
import 'package:ww_slot_booking_fe_flutter/core/configs/assets/app_images.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: Image.asset(
          AppImages.logo,
          width:100,
          height:100,
        ),
      ),
      body: Padding(
        padding:const EdgeInsets.symmetric(
          vertical:50,
          horizontal:30
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             _registerText(),
             const SizedBox(
              height:50,
             ),
             _fullNameField()
          ],
        ),
      ),
    );
  }
  Widget _registerText(){
    return const Text(
      'Register',
      style: TextStyle(
        fontWeight:FontWeight.bold,
        fontSize: 25
      ),
      textAlign: TextAlign.center,
    );
  }
  Widget _fullNameField(){
     return const TextField();
  }
}