import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ww_slot_booking_fe_flutter/common/widgets/button/basic_app_button.dart';
import 'package:ww_slot_booking_fe_flutter/core/configs/assets/app_images.dart';
import 'package:ww_slot_booking_fe_flutter/core/configs/assets/app_vectors.dart';
import 'package:ww_slot_booking_fe_flutter/core/configs/theme/app_colors.dart';
import 'package:ww_slot_booking_fe_flutter/presentation/auth/pages/signup_or_signin.dart';

class ChooseModePage extends StatefulWidget {
  const ChooseModePage({super.key});

  @override
  State<ChooseModePage> createState() => _ChooseModePageState();
}

class _ChooseModePageState extends State<ChooseModePage> {
  late Future<void> _imageLoadingFuture;

  @override
  void initState() {
    super.initState();
    _imageLoadingFuture = _preloadImage(context, AppImages.chooseModeBG);
  }

  Future<void> _preloadImage(BuildContext context, String imagePath) async {
    final image = AssetImage(imagePath);
    final completer = Completer<void>();
    final stream = image.resolve(const ImageConfiguration());
    stream.addListener(
      ImageStreamListener(
        (ImageInfo _, bool __) => completer.complete(),
        onError: (dynamic _, StackTrace? __) => completer.completeError(_),
      ),
    );
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _imageLoadingFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading spinner while the image loads
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // Handle errors during image loading
            return const Center(
              child: Text(
                'Failed to load image',
                style: TextStyle(color: Colors.red),
              ),
            );
          } else {
            // Render content once the image is loaded
            return Stack(
              children: [
                // Background image with opacity overlay
                Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(AppImages.chooseModeBG),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ],
                ),
                // Content
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 40,
                  ),
                  child: Column(
                    children: [
                      const Spacer(),
                      const Text(
                        'Choose Mode',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              ClipOval(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 10,
                                    sigmaY: 10,
                                  ),
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff30393c)
                                          .withOpacity(0.5),
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset(
                                      AppVectors.moon,
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Dark Mode',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: AppColors.grey,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(width: 40),
                          Column(
                            children: [
                                 GestureDetector(
                                  onTap: (){
                                    
                                  },
                                child: ClipOval(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 10,
                                      sigmaY: 10,
                                    ),
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff30393c)
                                            .withOpacity(0.5),
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.asset(
                                        AppVectors.sun,
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Light Mode',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: AppColors.grey,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      BasicAppButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const SignupOrSigninPage(),
                            ),
                          );
                        },
                        title: 'Continue',
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
