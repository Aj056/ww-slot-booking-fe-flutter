import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ww_slot_booking_fe_flutter/common/widgets/appbar/app_bar.dart';
import 'package:ww_slot_booking_fe_flutter/common/widgets/button/basic_app_button.dart';
import 'package:ww_slot_booking_fe_flutter/core/configs/assets/app_images.dart';
import 'package:ww_slot_booking_fe_flutter/core/configs/assets/app_vectors.dart';
import 'package:ww_slot_booking_fe_flutter/core/configs/theme/app_colors.dart';
import 'package:ww_slot_booking_fe_flutter/presentation/auth/pages/register.dart';

class SignupOrSigninPage extends StatelessWidget {
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppbar(),
            Align(
              alignment:Alignment.topRight,
              child: SvgPicture.asset(
                 AppVectors.topPattern
              ),
            ),
            Align(
              alignment:Alignment.bottomRight,
              child: SvgPicture.asset(
                 AppVectors.topBottom,
              ),
            ),
             Align(
              alignment:Alignment.bottomLeft,
              child: Image.asset(
                 AppImages.signup_signinImage,
                  width:170, // Set desired width
                  height:200, 
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child:Padding(
                padding:const EdgeInsets.symmetric(
                  horizontal:30
                ),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                       height:100,
                    ),
                    Image.asset(
                      AppImages.logo,
                      width:200,
                      height:100,
                    ),
                    const SizedBox(
                      height:30,
                    ),
                    const Text(
                      'Experience the Thrill of Sports',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height:20,
                    ),
                    const Text(
                      'From thrilling turf battles to exciting indoor games, we bring you an arena for all your gaming passions. ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:16,
                        color: AppColors.grey   
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height:70,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: BasicAppButton(
                            onPressed:(){
                              Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (BuildContext context) => const SignupPage())
                                );
                            },
                           title:'Register'),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextButton(onPressed:(){}, child:const Text(
                           'Sign In',
                           style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                           ),
                          )),
                        )
                      ],
                    ),
                    const SizedBox(
                      height:30,
                    ),
                    const Text(
                      'Are you Login Us Guest ? Click'
                    )
                  ],
                ),
              )
            )
        ],
      ),
    );
  }
}