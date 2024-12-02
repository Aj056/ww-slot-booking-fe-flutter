import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ww_slot_booking_fe_flutter/common/widgets/button/basic_app_button.dart';
import 'package:ww_slot_booking_fe_flutter/core/configs/assets/app_images.dart';
import 'package:ww_slot_booking_fe_flutter/core/configs/theme/app_colors.dart';
import 'package:ww_slot_booking_fe_flutter/presentation/choose_mode/page/choose_mode.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  late Future<void> _imageLoadingFuture;

  @override
  void initState() {
    super.initState();
    _imageLoadingFuture = _preloadImage(context, AppImages.introBG);
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
            // Show a loading spinner while the image is loading
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // Handle the error if the image fails to load
            return const Center(
              child: Text(
                'Failed to load image',
                style: TextStyle(color: Colors.red),
              ),
            );
          } else {
            // Display the content when the image is loaded
            return Stack(
              children: [
                // Background image with opacity overlay
                Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(AppImages.introBG),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.73),
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
                        'Experience the Thrill of Sports',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 21),
                      const Text(
                        'Step onto the ultimate playing field where every sport comes alive. From thrilling turf battles to exciting indoor games, we bring you an arena for all your gaming passions. Discover, book, and play at your favorite venues with ease—your game, your way!',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      BasicAppButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ChooseModePage(),
                            ),
                          );
                        },
                        title: 'Get Started',
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
