import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_doctor_house_mobile_app/app_router.dart';
import 'package:my_doctor_house_mobile_app/data/sample_doctors.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/doctors_screen/widgets/doctor_card_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final selectedCategory = useState(0);
    final categories = [
      'All',
      "General",
      "Dentist",
      "Nutrition",
      "Pediatric",
      "Neurology",
      "Radiolo",
      "Ophthal",
    ];
    final cards = [
      Assets.images.ads.path,
      Assets.images.ads.path,
      Assets.images.ads.path,
    ];

    final specialityString = [
      "General",
      "Neurology",
      "Nutrition",
      "Pediatric",
      "Dentist",
      "Radiolo",
      "Ophthal",
      "More",
    ];

    final specialityIcons = [
      Assets.icons.general.path,
      Assets.icons.neuruo.path,
      Assets.icons.nutration.path,
      Assets.icons.pediatric.path,
      Assets.icons.dentist.path,
      Assets.icons.radiolo.path,
      Assets.icons.ophthal.path,
      Assets.icons.moreSpicalist.path,
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70, // Add this line to control AppBar height
        automaticallyImplyLeading: false,
        backgroundColor: UIColor.kPrimaryLight,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 16),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: UIColor.kPrimaryDark,
                ),
              ),
              const Gap(12),
              Expanded(
                child: TextUtils(
                  'Good Morning, Ibrahim!',
                  style: context.semiBold(size: 16, color: UIColor.kGrey),
                ),
              ),
              Stack(
                children: [
                  SizedBox(
                    height: 34,
                    width: 34,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: InkWell(
                        onTap: () {
                          context.push(AppRouter.notificationsScreen);
                        },
                        child: SvgPicture.asset(
                            Assets.icons.notificationsIcon.path),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 6,
                    top: -10,
                    child: Container(
                      height: 32,
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 180,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      cards[index],
                    );
                  },
                ),
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: cards.length,
              effect: WormEffect(
                dotColor: Colors.grey.shade300,
                activeDotColor: UIColor.kPrimaryLight,
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextUtils(
                    'Doctor Speciality',
                    style: context.medium(size: 18),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {},
                    child: TextUtils(
                      'See All',
                      style: context.medium(size: 14)?.copyWith(
                            color: UIColor.kPrimaryLight,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(18),
            GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.8,
              ),
              itemCount: specialityString.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: UIColor.kPrimaryLight.withOpacity(0.1),
                      child: SvgPicture.asset(
                        specialityIcons[index],
                        colorFilter: const ColorFilter.mode(
                          UIColor.kPrimaryLight,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextUtils(
                      specialityString[index],
                      style: context.regular(size: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
            // Add Doctors Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextUtils(
                    'My Doctors',
                    style: context.medium(size: 18),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {},
                    child: TextUtils(
                      'See All',
                      style: context.medium(size: 14)?.copyWith(
                            color: UIColor.kPrimaryLight,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(16),

            // Add Container
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    categories.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () => selectedCategory.value = index,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: selectedCategory.value == index
                                ? UIColor.kPrimaryLight
                                : Colors.transparent,
                            border: Border.all(
                                color: UIColor.kPrimaryLight, width: 1),
                          ),
                          child: Text(
                            categories[index],
                            style: context.medium(size: 14)?.copyWith(
                                  color: selectedCategory.value == index
                                      ? UIColor.kWhite
                                      : UIColor.kPrimaryLight,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Gap(12),

            // Add TabBarView with Doctors List
            ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 3),
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 4,
              itemBuilder: (context, index) {
                return DoctorCard(
                  doctorName: sampleDoctors[0].name,
                  specialty: sampleDoctors[0].specialty,
                  rating: sampleDoctors[0].rating,
                  description: sampleDoctors[0].description,
                  address: sampleDoctors[0].address,
                  imageUrl: sampleDoctors[0].imageUrl,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
