import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboard_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnboardView extends GetView<OnboardController> {
  const OnboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: controller.onBoardingPages.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => Flexible(
                          flex: 3,
                          fit: FlexFit.tight,
                          child: PageView.builder(
                            physics: const ClampingScrollPhysics(),
                            controller: controller.pageController,
                            itemCount: controller.onBoardingPages.length,
                            itemBuilder: (context, index) {
                              final page = controller.onBoardingPages[index];

                              return Column(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: page.image,
                                    width: double.infinity,
                                  ),
                                  const SizedBox(
                                    height: 64.0,
                                  ),
                                  Text(
                                    page.title,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                  ),
                                  const SizedBox(
                                    height: 24.0,
                                  ),
                                ],
                              );
                            },
                            onPageChanged: controller.currentIndex,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            DotsIndicator(
                              dotsCount: controller.onBoardingPages.length,
                              position: controller.currentIndex.value,
                              decorator: DotsDecorator(
                                size: const Size.square(8.0),
                                color: Colors.black,
                                spacing: const EdgeInsets.only(left: 8.0),
                                activeSize: const Size(24.0, 8.0),
                                activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(36.0),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: FilledButton.icon(
                                onPressed: controller.next,
                                style: FilledButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size.fromHeight(44),
                                  backgroundColor: Colors.blueAccent,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                label: Obx(
                                  () => Text(
                                    controller.currentIndex.value ==
                                            controller.onBoardingPages.length -
                                                1
                                        ? "Welcome to APP"
                                        : "Continue",
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.arrow_back,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : const Center(child: CircularProgressIndicator.adaptive()),
        ));
  }
}
