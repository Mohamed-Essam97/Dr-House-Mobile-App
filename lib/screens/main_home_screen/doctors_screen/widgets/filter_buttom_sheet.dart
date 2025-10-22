import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/buttons/custom_normal_button.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';

void showFilterBottomSheet(BuildContext context) {
  bool isAvailableSelected = true;

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Gap(8),
                  // Header Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: UIColor.kGrey, width: 0.2),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.close,
                                size: 20,
                              ),
                            )),
                      ),
                      TextUtils('Filter by', style: context.medium(size: 19)),
                      GestureDetector(
                        onTap: () {
                          // Handle reset
                        },
                        child: TextUtils(
                          'Reset',
                          style: context.medium(
                              color: UIColor.kPrimaryLight, size: 15),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Availability Toggle
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() {
                            isAvailableSelected = !isAvailableSelected;
                          }),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: !isAvailableSelected
                                  ? UIColor.kPrimaryLight.withOpacity(0.08)
                                  : Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: TextUtils(
                                'Available',
                                style: TextStyle(
                                  color: !isAvailableSelected
                                      ? UIColor.kPrimaryLight
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() {
                            isAvailableSelected = !isAvailableSelected;
                          }),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: isAvailableSelected
                                  ? UIColor.kPrimaryLight.withOpacity(0.08)
                                  : Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: TextUtils(
                                'Not Available',
                                style: TextStyle(
                                  color: isAvailableSelected
                                      ? UIColor.kPrimaryLight
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Specialties Section
                  TextUtils(
                    'Specialties',
                    style: context.medium(
                      size: 15,
                    ),
                  ),
                  const Gap(8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: UIColor.kGrey, width: 0.4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextUtils(
                          'Select you specialist',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                      ],
                    ),
                  ),
                  const Gap(18),

                  // Services Section
                  TextUtils(
                    'Services',
                    style: context.medium(
                      size: 15,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: UIColor.kGrey, width: 0.4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextUtils(
                          'Select you service',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Rating Section
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildRatingChip('3.0'),
                        _buildRatingChip('4.0'),
                        _buildRatingChip('4.8', isSelected: true),
                        _buildRatingChip('5.0'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Show Results Button
                  NormalButton(onPressed: () {}, text: "Show results"),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

Widget _buildRatingChip(String rating, {bool isSelected = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue[50] : Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 14,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset(
            Assets.icons.star.path,
          ),
          const Gap(8),
          TextUtils(
            rating,
            style: TextStyle(
              color: isSelected ? UIColor.kPrimaryLight : Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}
