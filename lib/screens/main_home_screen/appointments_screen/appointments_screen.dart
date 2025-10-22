import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_doctor_house_mobile_app/app_router.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/buttons/custom_normal_button.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/dialogs/alert_dialog.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';

class AppointmentsScreen extends HookWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(initialLength: 3, initialIndex: 1);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: UIColor.kWhite,
        appBar: CustomAppBar(
          leading: const SizedBox(),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: InkWell(
                onTap: () {
                  context.push(AppRouter.addAppointmentScreen);
                },
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: UIColor.kGrey, width: 0.3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(Assets.icons.add.path),
                    )),
              ),
            )
          ],
          title: TextUtils(
            "My Appointments",
            style: context.medium(size: 19),
          ),
        ),
        body: Column(
          children: [
            const Gap(8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: UIColor.kLightGrey.withOpacity(0.2),
                ),
                child: TabBar(
                  controller: controller,
                  labelColor: UIColor.kPrimaryLight,
                  unselectedLabelColor: UIColor.kGrey,
                  indicatorSize: TabBarIndicatorSize.tab,
                  unselectedLabelStyle: context.medium(size: 13),
                  labelStyle: context.semiBold(size: 13),
                  indicator: BoxDecoration(
                    color: UIColor.kOpictyLight,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  dividerColor: Colors.transparent,
                  // padding: const EdgeInsets.symmetric(horizontal: 16),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                  tabs: const [
                    Tab(text: 'COMPLETED'),
                    Tab(text: 'UPCOMING'),
                    Tab(text: 'CANCELED'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: const [
                  AppointmentsList(status: 'Completed'),
                  AppointmentsList(status: 'Upcoming'),
                  AppointmentsList(status: 'Canceled'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentsList extends StatelessWidget {
  final String status;

  const AppointmentsList({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 10, // Replace with your actual appointments list length
      itemBuilder: (context, index) {
        return const AppointmentCard();
      },
    );
  }
}

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. John Doe',
                          style: context.medium(size: 15),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Cardiologist',
                          style: context.regular(
                            size: 14,
                            color: UIColor.kTextDarkGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                      'https://www.google.com/url?sa=i&url=https%3A%2F%2Fsnibbs.co%2Fblogs%2Fhealthcare-best-practices%2Fchallenges-of-being-a-doctor&psig=AOvVaw0He7q0-yyIOxYPJmUbQgqr&ust=1731720047600000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCJDW7oSW3YkDFQAAAAAdAAAAABAJ', // Replace with actual doctor image
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 0.4,
                color: UIColor.kGrey,
              ),
              const Gap(6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(Assets.icons.fiiledCalendar.path),
                      const SizedBox(width: 4),
                      TextUtils(
                        '23/03/2025',
                        style: context.regular(
                            size: 13, color: UIColor.kTextDarkGrey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.icons.time.path),
                      const SizedBox(width: 4),
                      TextUtils(
                        '10:30 AM',
                        style: context.regular(
                            size: 13, color: UIColor.kTextDarkGrey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: UIColor.kGreen,
                        radius: 4,
                      ),
                      const SizedBox(width: 4),
                      TextUtils(
                        'Confirmed',
                        style: context.regular(
                            size: 13, color: UIColor.kTextDarkGrey),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(6),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: NormalButton(
                        onPressed: () {
                          showDialog(
                            barrierColor: Colors.black45.withOpacity(0.6),
                            context: context,
                            barrierDismissible: true,
                            builder: (context) => BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: CustomAlertDialog(
                                onPressed: () {
                                  context.pop();
                                },
                                description:
                                    'Are you sure you want to cancel the appointment ?',
                                buttonText: 'BACK TO LOGIN PAGE',
                              ),
                            ),
                          );
                        },
                        text: "CANCEL",
                        height: 44,
                        textStyle: context.medium(
                          size: 14,
                          color: UIColor.kDisabledTextGrey,
                        ),
                        color: UIColor.kLightGrey.withOpacity(0.2),
                      )),
                  const SizedBox(width: 17),
                  Expanded(
                    flex: 3,
                    child: NormalButton(
                      height: 44,
                      color: UIColor.kOpictyLight,
                      textStyle: context.medium(
                        size: 14,
                        color: UIColor.kPrimaryLight,
                      ),
                      onPressed: () {},
                      text: "RESCHEDULE",
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: NormalButton(
                    height: 44,
                    onPressed: () {
                      context.push(AppRouter.healthConcernsScreen);
                    },
                    textStyle: context.medium(size: 14, color: UIColor.kWhite),
                    text: "View Health Concerns".toUpperCase()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
