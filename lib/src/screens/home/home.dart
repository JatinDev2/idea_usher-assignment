import 'package:boozin_fitness/src/controller/helth_repository.dart';
import 'package:boozin_fitness/src/utils/font_style.dart';
import 'package:boozin_fitness/src/utils/image_path.dart';
import 'package:boozin_fitness/src/utils/loading_shimmer.dart';
import 'package:boozin_fitness/src/utils/strings.dart';
import 'package:boozin_fitness/src/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:boozin_fitness/src/widgets/error.dart' as error;

class Home extends GetView<HelthRepository> {
  const Home({Key? key}) : super(key: key);

  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 10),

        child: Obx(() {
          final healthPoint = controller.healthPoint;
          num steps=0;
          num calories=0;
          if (controller.error.isNotEmpty) {
            return error.Error(controller: controller);
          }

          if (healthPoint.isNotEmpty) {
            // steps = _healthPoint.first.value;
            // calories = _healthPoint.last.value;
          } else {
            steps = 0;
            calories = 0;
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppText.hi,
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: AppFont.nunito,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 40),

              LoadingShimmer(
                loading: controller.isLoading.value,
                //if steps is not null show steps
                child: HomeCard(
                  iconPath: ImagePath(context).iconFootSteps,
                  heading: AppText.steps,
                  value: steps.toDouble(),
                  title: '$steps',
                  goal: '15,000',
                ),
              ),

              LoadingShimmer(
                loading: controller.isLoading.value,
                //if calories is not null show calories
                child: HomeCard(
                  iconPath: ImagePath(context).iconKcal,
                  heading: AppText.caloriesBurned,
                  value: calories.toDouble(),
                  title: '$calories',
                  goal: '15,000',
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
