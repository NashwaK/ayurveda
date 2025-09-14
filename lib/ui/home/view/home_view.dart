import 'package:ayurveda/res/colors.dart';
import 'package:ayurveda/ui/home/bind/home_bind.dart';
import 'package:ayurveda/ui/home/view/more.dart';
import 'package:ayurveda/utilities/common_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        actions: const [
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: GetBuilder<HomeController>(
        builder: (logic) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Box
                SearchPart(),
                const SizedBox(height: 16),

                // Sort By
                SortingPart(),
                ListPart().cPadOnly(t: 15)
              ],
            ).cPadAll(20),
          );
        }
      ),
    );
  }
}
