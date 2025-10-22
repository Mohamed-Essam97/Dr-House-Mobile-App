import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/buttons/custom_normal_button.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/appointments_screen/add_appointment_screen/widgets/success_book_appointment_dialog.dart';

class AddAppointmentScreen extends StatefulWidget {
  const AddAppointmentScreen({super.key});

  @override
  State<AddAppointmentScreen> createState() => _AddAppointmentScreenState();
}

class _AddAppointmentScreenState extends State<AddAppointmentScreen> {
  String? selectedService;
  DateTime selectedDate = DateTime.now();
  String? selectedTime;
  final noteController = TextEditingController();

  // Sample service list
  final List<String> services = [
    'General Checkup',
    'Dental Care',
    'Eye Check',
    'Cardiology'
  ];
  // Sample time slots
  final List<String> timeSlots = [
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
    '05:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColor.kWhite,
      appBar: CustomAppBar(
        title: TextUtils("Book Appointment", style: context.medium(size: 19)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(21.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Service Dropdown
                  TextUtils("Select Service", style: context.medium(size: 17)),
                  const Gap(8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: UIColor.kGrey, width: 0.4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: selectedService,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      iconSize: 24,
                      iconEnabledColor: UIColor.kGrey,
                      hint: TextUtils(
                        'Select a service',
                        style: context.regular(
                          size: 14,
                          color: UIColor.kDisabledTextGrey,
                        ),
                      ),
                      items: services.map((service) {
                        return DropdownMenuItem(
                          value: service,
                          child: Text(service),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() => selectedService = value);
                      },
                    ),
                  ),

                  // Calendar
                  const Gap(15),
                  Container(
                    height: 280,
                    decoration: BoxDecoration(
                      color: UIColor.kPrimaryLight.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                          primary:
                              UIColor.kPrimaryLight, // Selected date background
                          onPrimary: UIColor.kWhite, // Selected date text color
                          onSurface: Colors.black, // Default text color
                        ),
                      ),
                      child: CalendarDatePicker(
                        initialDate: selectedDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 90)),
                        onDateChanged: (date) {
                          setState(() => selectedDate = date);
                        },
                        selectableDayPredicate: (DateTime date) => true,
                      ),
                    ),
                  ),

                  const Gap(15),

                  // Time Slots
                  TextUtils("Select Time", style: context.medium(size: 17)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 21),
              child: SizedBox(
                height: 33,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: timeSlots.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTime = selectedTime == timeSlots[index]
                                ? null
                                : timeSlots[index];
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: selectedTime == timeSlots[index]
                                ? UIColor.kPrimaryLight
                                : UIColor.kWhite,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: UIColor.kPrimaryLight,
                              width: 1,
                            ),
                          ),
                          child: TextUtils(
                            timeSlots[index],
                            style: context.regular(
                              size: 16,
                              color: selectedTime == timeSlots[index]
                                  ? UIColor.kWhite
                                  : UIColor.kPrimaryLight,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const Gap(16),

            // Notes TextField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: TextField(
                controller: noteController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Type note here...',
                  hintStyle: context.regular(
                    size: 14,
                    color: UIColor.kGrey,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  filled: true,
                  fillColor: UIColor.kGrey.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const Gap(24),

            // Submit Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: NormalButton(
                onPressed: () {
                  _showSuccessAppointmentDialog(context);
                },
                text: "Book Appointment",
                height: 50,
                textStyle: context.medium(size: 16, color: UIColor.kWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showSuccessAppointmentDialog(context) {
    showDialog(
        barrierColor: Colors.black45.withOpacity(0.6),
        context: context,
        barrierDismissible: true,
        builder: (context) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: SuccessBookAppointmentDialog(
                title: 'Congratulations!',
                onPressed: () {
                  context.pop();
                  context.pop();
                },
                description:
                    'Your appointments with dr.maynul islam is Pending.',
                buttonText: 'View appointment',
              ),
            ));
  }
}
