import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_second_diary/controllers/bottom_app_bar_index_controller.dart';
import 'package:one_second_diary/pages/home/base/widgets/app_bar.dart';
import 'package:one_second_diary/pages/home/create_movie/create_movie_screen.dart';
import 'package:one_second_diary/pages/home/daily_entry/daily_entry_page.dart';
import 'package:one_second_diary/pages/home/settings/settings_page.dart';
import 'widgets/bottom_app_bar.dart';

class HomePage extends GetView<BottomAppBarIndexController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: CustomBottomAppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Obx(() => _getSelectedPage(controller.activeIndex.value)),
        ),
      ),
    );
  }

  Widget _getSelectedPage(int index) {
    switch (index) {
      case 0:
        return DailyEntryPage();
      case 1:
        return CreateMoviePage();
      case 2:
        return SettingPage();
      default:
        return DailyEntryPage();
    }
  }
}
