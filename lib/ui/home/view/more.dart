import 'package:ayurveda/res/colors.dart';
import 'package:ayurveda/ui/home/bind/home_bind.dart';
import 'package:ayurveda/utilities/common_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SearchPart extends StatelessWidget {
  const SearchPart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (logic) {
        return Row(
          children: [
            Expanded(
              child: CustomizedTextFieldGreyBg(
                controller: logic.searchController,
                hintText: 'Search for treatments',
                focusNode: logic.searchFocusNode,
                height: 35,
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Search",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}

class SortingPart extends StatelessWidget {
  const SortingPart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (logic) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Sort by :",
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            Obx(() {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: DropdownButton<String>(
                    value: logic.sortBy.value,
                    isDense: true,
                    items: ["Date", "Name"].map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      logic.sortBy.value = value!;
                    },
                    underline: const SizedBox(),
                    borderRadius: BorderRadius.circular(20),
                    icon: const Icon(Icons.arrow_drop_down, size: 18, color: Colors.black54),
                  ),
                ),
              );
            }),
          ],
        );
      },
    );
  }
}

class ListPart extends StatelessWidget {
  const ListPart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (logic) {
        return Column(
          children: [
            (logic.patientListModelClass?.patient?.length == 0)
            ? Text('No Data')
            : ListView.builder(
              itemCount: 10,
              // itemCount: logic.patientListModelClass?.patient?.length ?? 0,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                var data = logic.patientListModelClass?.patient?[i];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(241, 241, 241, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Top Row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${i+1}.',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Name
                                const Text(
                                  "Vikram Singh",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),

                                // Package
                                const Text(
                                  'Couple Combo Package (Rejuven...',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 12),

                                // Date + Doctor
                                Row(
                                  children: const [
                                    Icon(Icons.calendar_today,
                                        size: 16, color: Colors.red),
                                    SizedBox(width: 4),
                                    Text(
                                      '31/01/2024',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    SizedBox(width: 12),
                                    Icon(Icons.person,
                                        size: 16, color: Colors.red),
                                    SizedBox(width: 4),
                                    Text(
                                      'Jithesh',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      /// Divider (full width now)
                      const Divider(thickness: 1, color: Colors.grey),

                      const SizedBox(height: 8),

                      /// Bottom Action
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "View Booking details",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 16, color: primaryColor),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
