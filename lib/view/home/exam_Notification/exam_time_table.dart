import 'package:lepton_dujo_application/view/colors/colors.dart';
import 'package:lepton_dujo_application/view/home/exam_Notification/public_level.dart';
import 'package:lepton_dujo_application/view/home/exam_Notification/state_Level.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExmNotifications extends StatelessWidget {
  const ExmNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Exams'.tr),
          backgroundColor: adminePrimayColor,
          bottom: TabBar(tabs: [
            Tab(
              text: 'School Level'.tr,
            ),
            Tab(
              text: 'Public Level'.tr,
            )
          ]),
        ),
        body: const SafeArea(
          child: TabBarView(
            children: [
              PublicLevel(),
              StateLevel(),
            ],
          ),
        ),
      ),
    );
  }
}
