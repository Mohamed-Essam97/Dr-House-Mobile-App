import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_doctor_house_mobile_app/data/sample_doctors.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/models/doctor.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/doctors_screen/widgets/doctor_card_widget.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/doctors_screen/widgets/filter_buttom_sheet.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Doctor> filteredDoctors = sampleDoctors;

  void _filterDoctors(String query) {
    setState(
      () {
        filteredDoctors = sampleDoctors
            .where((doctor) =>
                doctor.name.toLowerCase().contains(query.toLowerCase()) ||
                doctor.specialty.toLowerCase().contains(query.toLowerCase()))
            .toList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: const SizedBox(),
        title: const TextUtils('Doctors'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                border: Border.all(color: UIColor.kLightGrey.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                icon: SvgPicture.asset(Assets.icons.filter.path),
                onPressed: () => showFilterBottomSheet(context),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Field
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
            child: SizedBox(
              height: 46,
              child: TextField(
                controller: _searchController,
                onChanged: _filterDoctors,
                decoration: InputDecoration(
                  hintText: 'Search a Doctor...',
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 4, horizontal: 18), // Add this

                  hintStyle:
                      context.regular(size: 16, color: UIColor.kTextDarkGrey),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(14),
                    child: SvgPicture.asset(
                      Assets.icons.search.path,
                    ),
                  ),
                  filled: true,
                  fillColor: UIColor.kLightGrey.withOpacity(0.3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          // Doctors List
          Expanded(
            child: ListView.builder(
              itemCount: filteredDoctors.length,
              padding: const EdgeInsets.symmetric(vertical: 2),
              itemBuilder: (context, index) {
                final doctor = filteredDoctors[index];
                return DoctorCard(
                  doctorName: doctor.name,
                  specialty: doctor.specialty,
                  rating: doctor.rating,
                  description: doctor.description,
                  address: doctor.address,
                  imageUrl: doctor.imageUrl,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildDoctorCard() {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(12),
  //       color: Colors.white,
  //       boxShadow: [
  //         // Outer shadow
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.15),
  //           blurRadius: 4,
  //           offset: const Offset(0, 2),
  //         ),
  //         // Inner shadow
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.15),
  //           blurRadius: 50,
  //           spreadRadius: -20,
  //           offset: const Offset(0, 0),
  //         ),
  //       ],
  //     ),
  //     child: ClipRRect(
  //       borderRadius: BorderRadius.circular(12),
  //       child: Padding(
  //         padding: const EdgeInsets.all(8),
  //         child: Row(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             const Gap(8),
  //             // Doctor Image
  //             const SizedBox(
  //               height: 100,
  //               width: 100,
  //             ),
  //             const SizedBox(width: 12),
  //             // Doctor Details
  //             Expanded(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   TextUtils(
  //                     'Dr. John Doe',
  //                     style: context.heading3,
  //                   ),
  //                   const SizedBox(height: 4),
  //                   Row(
  //                     children: [
  //                       TextUtils(
  //                         'Cardiologist',
  //                         style: context.description,
  //                       ),
  //                       const Padding(
  //                         padding: EdgeInsets.symmetric(horizontal: 4),
  //                         child: CircleAvatar(
  //                           radius: 2,
  //                           backgroundColor: UIColor.kGrey,
  //                         ),
  //                       ),
  //                       SvgPicture.asset(
  //                         Assets.icons.star.path,
  //                         height: 10,
  //                         color: UIColor.kPrimaryLight,
  //                       ),
  //                       const SizedBox(width: 4),
  //                       TextUtils(
  //                         '4.5',
  //                         style: context.description,
  //                       ),
  //                     ],
  //                   ),
  //                   const SizedBox(height: 4),
  //                   TextUtils(
  //                     'Experienced doctor with 10+ years of practice',
  //                     style: context.description,
  //                   ),
  //                   const SizedBox(height: 4),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Expanded(
  //                         flex: 3,
  //                         child: Row(
  //                           children: [
  //                             SvgPicture.asset(Assets.icons.location.path),
  //                             const Gap(4),
  //                             SizedBox(
  //                               width: 100,
  //                               child: TextUtils(
  //                                 '458 Carlotta Views Apt',
  //                                 style: context.description,
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                       Expanded(
  //                         flex: 3,
  //                         child: NormalButton(
  //                           height: 33,
  //                           color: UIColor.kPrimaryLight.withOpacity(0.1),
  //                           textColor: UIColor.kPrimaryLight,
  //                           onPressed: () {},
  //                           text: "View Details",
  //                           textStyle: context.bodyLarge!.copyWith(
  //                               fontSize: 12, color: UIColor.kPrimaryLight),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // void _showFilterBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //     ),
  //     builder: (context) {
  //       return Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             TextUtils(
  //               'Filter Doctors',
  //               style: Theme.of(context).textTheme.titleLarge,
  //             ),
  //             const SizedBox(height: 16),
  //             // Availability Filter
  //             const TextUtils('Availability'),
  //             const Row(
  //               children: [
  //                 FilterChip(
  //                   label: TextUtils('Available Now'),
  //                   selected: false,
  //                   onSelected: null,
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(height: 16),
  //             // Specialties Filter
  //             const TextUtils('Specialties'),
  //             Wrap(
  //               spacing: 8,
  //               children: [
  //                 FilterChip(
  //                   label: const TextUtils('Cardiology'),
  //                   selected: false,
  //                   onSelected: (bool selected) {},
  //                 ),
  //                 FilterChip(
  //                   label: const TextUtils('Neurology'),
  //                   selected: false,
  //                   onSelected: (bool selected) {},
  //                 ),
  //                 // Add more specialties
  //               ],
  //             ),
  //             const SizedBox(height: 16),
  //             // Rating Filter
  //             const TextUtils('Rating'),
  //             Wrap(
  //               spacing: 8,
  //               children: List.generate(
  //                 5,
  //                 (index) => FilterChip(
  //                   label: TextUtils('${5 - index}+ Stars'),
  //                   selected: false,
  //                   onSelected: (bool selected) {},
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}
