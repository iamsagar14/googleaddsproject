import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rewardedads_controller.dart';

class RewardedadsView extends GetView<RewardedadsController> {
  const RewardedadsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RewardedadsView'),
          centerTitle: true,
        ),
        body: GetBuilder<RewardedadsController>(
          init: RewardedadsController(),
          initState: (_) {},
          builder: (_) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.LoadRewardedAd();
                    },
                    child: const Text('Loads Reward Ads'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.showRewardedAd();
                      controller.LoadRewardedAd();
                    },
                    child: const Text('Show Reward Ads'),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
