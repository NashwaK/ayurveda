import 'package:ayurveda/res/colors.dart';
import 'package:ayurveda/ui/sign_up/bind/signup_bind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class LocationDropdown extends StatelessWidget {
  const LocationDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (logic) {
        return Obx(() {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100, // light background
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: logic.selectedLocation.value,
                hint: const Text(
                  "Choose your location",
                  style: TextStyle(color: Colors.grey),
                ),
                isExpanded: true,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xFF006837), // your green color
                ),
                items: logic.locations.map((loc) {
                  return DropdownMenuItem<String>(
                    value: loc,
                    child: Text(loc),
                  );
                }).toList(),
                onChanged: (value) {
                  logic.selectedLocation.value = value;
                },
              ),
            ),
          );
        });
      }
    );
  }
}

class BranchDropdown extends StatelessWidget {
  const BranchDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (logic) {
        return Obx(() {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100, // light background
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: logic.selectedBranch.value,
                hint: const Text(
                  "Select the branch",
                  style: TextStyle(color: Colors.grey),
                ),
                isExpanded: true,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xFF006837), // your green color
                ),
                items: logic.branches.map((loc) {
                  return DropdownMenuItem<String>(
                    value: loc,
                    child: Text(loc),
                  );
                }).toList(),
                onChanged: (value) {
                  logic.selectedBranch.value = value;
                },
              ),
            ),
          );
        });
      }
    );
  }
}

class TreatmentSelection extends StatelessWidget {
  const TreatmentSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (logic) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          width: context.cWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color.fromRGBO(240, 240, 240, 1)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1.',style: TextStyle(fontWeight: FontWeight.bold),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Couple Combo package i..',style: TextStyle(fontWeight: FontWeight.bold),).cPadOnly(l: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Male',style: TextStyle(color: primaryColor),).cPadOnly(l: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4)
                            ),
                            child: Text('2'),
                          ).cPadOnly(l: 10),
                          Text('Female',style: TextStyle(color: primaryColor),).cPadOnly(l: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4)
                            ),
                            child: Text('2'),
                          ).cPadOnly(l: 10),
                        ],
                      ).cPadOnly(t: 5),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                GestureDetector(
                  onTap: (){},
                  child: Icon(Icons.cancel,color: Color.fromRGBO(242, 30, 30, 0.6)
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Icon(Icons.edit,color: primaryColor,size: 20,),
                ).cPadOnly(t: 5),
                ],
              )
            ],
          ),
        );
      }
    );
  }
}

class PaymentOption extends StatelessWidget {
  const PaymentOption({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (logic) {
        return  Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: logic.paymentOptions.map((option) {
              return Row(
                children: [
                  Radio<String>(
                    value: option,
                    groupValue: logic.selectedPaymentOption.value,
                    activeColor: primaryColor,
                    onChanged: (value) {
                      logic.selectedPaymentOption.value = value!;
                    },
                  ),
                  Text(
                    option,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: logic.selectedPaymentOption.value == option
                          ? primaryColor
                          : Colors.black,
                    ),
                  ),
                ],
              );
            }).toList(),
          );
        });
      }
    );
  }
}

class DateFilterPart extends StatelessWidget {
  const DateFilterPart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (logic) {
        return
          Obx(() {
            return InkWell(
              onTap: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  logic.selectedDate.value =
                  "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0F0),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      logic.selectedDate.value.isEmpty
                          ? "Select Date"
                          : logic.selectedDate.value,
                      style: const TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    const Icon(Icons.calendar_today,
                        color: Color(0xFF389A48)), // green icon
                  ],
                ),
              ),
            );
          });
      }
    );
  }
}


class TreatmentTimePart extends StatelessWidget {
  const TreatmentTimePart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (logic) {
        return
          Obx(() {
            return Row(
              children: [
                // Hour dropdown
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F0F0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
                      value: logic.selectedHour.value.isEmpty
                          ? null
                          : logic.selectedHour.value,
                      hint: const Text("Hour"),
                      isExpanded: true,
                      underline: const SizedBox(),
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Color(0xFF389A48)),
                      items: logic.hours
                          .map((h) => DropdownMenuItem(
                        value: h,
                        child: Text(h),
                      ))
                          .toList(),
                      onChanged: (value) {
                        logic.selectedHour.value = value!;
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Minute dropdown
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F0F0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
                      value: logic.selectedMinute.value.isEmpty
                          ? null
                          : logic.selectedMinute.value,
                      hint: const Text("Minutes"),
                      isExpanded: true,
                      underline: const SizedBox(),
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Color(0xFF389A48)),
                      items: logic.minutes
                          .map((m) => DropdownMenuItem(
                        value: m,
                        child: Text(m),
                      ))
                          .toList(),
                      onChanged: (value) {
                        logic.selectedMinute.value = value!;
                      },
                    ),
                  ),
                ),
              ],
            );
          });
      }
    );
  }
}
