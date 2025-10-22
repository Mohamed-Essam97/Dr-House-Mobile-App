import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/images/cached_network_image.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';
import 'package:sizer/sizer.dart';

final kInnerDecoration = BoxDecoration(
  color: const Color(0x9918181B),
  borderRadius: BorderRadius.circular(32),
  boxShadow: [
    BoxShadow(
      color: const Color.fromARGB(255, 10, 70, 116).withOpacity(1),
      blurRadius: 40,
      spreadRadius: -8,
    ),
    const BoxShadow(
      offset: Offset(-5, 0),
      color: Color.fromARGB(255, 66, 7, 87),
      spreadRadius: -8,
      blurRadius: 40.0,
    ),
  ],
);

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.doctorName,
    required this.specialty,
    required this.rating,
    required this.description,
    required this.address,
    required this.imageUrl,
  });

  final String doctorName;
  final String specialty;
  final double rating;
  final String description;
  final String address;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6.5),
      child: Container(
        decoration: BoxDecoration(
          color: UIColor.kWhite,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: UIColor.kGrey,
              spreadRadius: -4,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
            BoxShadow(
              color: UIColor.kGrey,
              spreadRadius: -28,
              blurRadius: 15,
              offset: Offset(22, 22),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(4),
              // Doctor Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const SizedBox(
                  height: 80,
                  width: 75,
                  child: CachedNetworkImageWidget(
                    imageUrl:
                        "https://imageio.forbes.com/specials-images/imageserve/1139665860/Attractive-trustworthy-senior-female-doctor-smiling-on-white-background/960x0.jpg?height=473&width=711&fit=bounds",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Doctor Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                      'Dr. John Doe',
                      style: context.semiBold(size: 14),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        TextUtils(
                          'Neurology',
                          style: context.regular(
                              size: 11, color: UIColor.kTextDarkGrey),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: CircleAvatar(
                            radius: 1.4,
                            backgroundColor: UIColor.kTextDarkGrey,
                          ),
                        ),
                        SvgPicture.asset(
                          Assets.icons.star.path,
                          height: 10,
                          color: UIColor.kPrimaryLight,
                        ),
                        const SizedBox(width: 6),
                        TextUtils(
                          '4.5',
                          style: context.regular(
                              size: 11, color: UIColor.kTextDarkGrey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    TextUtils(
                      'Experienced doctor with 10+ years of practice',
                      style: context.regular(
                          size: 11, color: UIColor.kTextDarkGrey),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              SvgPicture.asset(Assets.icons.location.path),
                              const Gap(4),
                              SizedBox(
                                width: 30.w,
                                child: TextUtils(
                                  '458 Carlotta Views Apt',
                                  style: context.regular(
                                      size: 11, color: UIColor.kDarkGrey),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 25,
                            decoration: BoxDecoration(
                              color: UIColor.kPrimaryLight.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: TextUtils(
                                "View Details",
                                style: context
                                    .medium(size: 11)!
                                    .copyWith(color: UIColor.kPrimaryLight),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
