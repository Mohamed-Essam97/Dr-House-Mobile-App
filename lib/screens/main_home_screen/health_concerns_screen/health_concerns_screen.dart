import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/buttons/custom_normal_button.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';

class HealthConcernsScreen extends StatelessWidget {
  const HealthConcernsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: UIColor.kWhite,
      appBar: CustomAppBar(
        title: TextUtils("Health Concerns"),
      ),
      body: HealthConcernsList(status: 'Active'),
    );
  }
}

class HealthConcernsList extends StatelessWidget {
  final String status;

  const HealthConcernsList({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const HealthConcernCard();
      },
    );
  }
}

class HealthConcernCard extends StatelessWidget {
  const HealthConcernCard({super.key});

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
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    radius: 23,
                    backgroundImage: NetworkImage(
                      'https://placeholder.com/150', // Replace with actual doctor image
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
                        'Done',
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
                      flex: 3,
                      child: NormalButton(
                        onPressed: () {},
                        text: "View".toUpperCase(),
                        height: 44,
                        textStyle: context.medium(
                          size: 14,
                          color: UIColor.kDisabledTextGrey,
                        ),
                        color: UIColor.kLightGrey.withOpacity(0.2),
                      )),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 4,
                    child: NormalButton(
                      height: 44,
                      color: UIColor.kOpictyLight,
                      textStyle: context.medium(
                        size: 14,
                        color: UIColor.kPrimaryLight,
                      ),
                      onPressed: () {},
                      text: "download".toUpperCase(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
