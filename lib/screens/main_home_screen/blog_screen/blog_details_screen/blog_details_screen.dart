import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:my_doctor_house_mobile_app/domain/models/blog_model.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/images/cached_network_image.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';
import 'package:sizer/sizer.dart';

class BlogDetailsScreen extends StatelessWidget {
  final Blog blog;

  const BlogDetailsScreen({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: SizedBox(
          width: 50.w,
          child: TextUtils(
            blog.title,
          ),
        ),
      ),
      body: RawScrollbar(
        thumbColor: UIColor.kPrimaryLight,
        trackColor: UIColor.kPrimaryLight.withOpacity(0.6),
        trackBorderColor: UIColor.kPrimaryLight.withOpacity(0.6),
        radius: const Radius.circular(20),
        thickness: 4,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(19.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Blog Image with Specialty Tag
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                  child: CachedNetworkImageWidget(
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl: blog.imageUrl,
                  ),
                ),
                const Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: UIColor.kPrimaryLight,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: TextUtils(blog.specialty,
                          style: context.medium(color: Colors.white, size: 8)),
                    ),
                    Row(
                      children: [
                        TextUtils(
                          "Jan 3, 2022",
                          style: context.regular(size: 10)?.copyWith(
                                color: UIColor.kTextDarkGrey,
                              ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: CircleAvatar(
                            radius: 1,
                            backgroundColor: UIColor.kTextDarkGrey,
                          ),
                        ),
                        TextUtils(
                          '${blog.views} views',
                          style: context.regular(size: 10)?.copyWith(
                                color: UIColor.kTextDarkGrey,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Gap(12),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    TextUtils(
                      blog.title,
                      shouldTrim: false,
                      style: context.bold(size: 18),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundImage:
                                  NetworkImage(blog.doctorImageUrl),
                            ),
                            const SizedBox(width: 8),
                            TextUtils(
                              'Dr. ${blog.doctorName}',
                              style: context.medium(size: 10),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              color: UIColor.kGrey.withOpacity(0.3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: SvgPicture.asset(Assets.icons.share.path),
                            ))
                      ],
                    ),
                    const Gap(4),
                    const Divider(
                      thickness: 0.2,
                      color: UIColor.kGrey,
                    ),
                    // Blog Content
                    Html(
                      data: _blogContent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const String _blogContent = """
<p>Welcome to My Dr. House, your trusted partner in healthcare, designed to make accessing medical services effortless and convenient. At My Dr. House, we prioritize  your health and wellness, providing a seamless connection to top healthcare providers across all specialties.</p>

<p>With My Dr. House, you can:</p>

<p>.Browse Specialties:  Discover a wide range of specialists, from general practitioners to highly specialized doctors, and choose the best fit for your health needs.</p>

<p>.Book Appointments:  Schedule appointments quickly and easily, helping you manage your healthcare without hassle.</p>

<p>.Access Medical Records:  Securely store and retrieve your medical history, prescriptions, and treatment plans anytime, anywhere.</p>

<p>.Stay Informed:  Receive timely notifications and updates, ensuring you&rsquo;re always in control of your healthcare journey.</p>

<p></p>

<p></p>

<p> Welcome to My Dr. House, your trusted partner in healthcare, designed to make accessing medical services effortless and convenient. At My Dr. House, we prioritize  your health and wellness, providing a seamless connection to top healthcare providers across all specialties.</p>

<p>With My Dr. House, you can:</p>

<p>.Browse Specialties:  Discover a wide range of specialists, from general practitioners to highly specialized doctors, and choose the best fit for your health needs.</p>

<p>.Book Appointments:  Schedule appointments quickly and easily, helping you manage your healthcare without hassle.</p>

<p>.Access Medical Records:  Securely store and retrieve your medical history, prescriptions, and treatment plans anytime, anywhere.</p>

<p>.Stay Informed:  Receive timely notifications and updates, ensuring you&rsquo;re always in control of your healthcare journey.</p>

<p></p>

<p></p>

<p> Welcome to My Dr. House, your trusted partner in healthcare, designed to make accessing medical services effortless and convenient. At My Dr. House, we prioritize  your health and wellness, providing a seamless connection to top healthcare providers across all specialties.</p>

<p>With My Dr. House, you can:</p>

<p>.Browse Specialties:  Discover a wide range of specialists, from general practitioners to highly specialized doctors, and choose the best fit for your health needs.</p>

<p>.Book Appointments:  Schedule appointments quickly and easily, helping you manage your healthcare without hassle.</p>

<p>.Access Medical Records:  Securely store and retrieve your medical history, prescriptions, and treatment plans anytime, anywhere.</p>

<p>.Stay Informed:  Receive timely notifications and updates, ensuring you&rsquo;re always in control of your healthcare journey.</p>

<p></p>

<p></p>

<p> Welcome to My Dr. House, your trusted partner in healthcare, designed to make accessing medical services effortless and convenient. At My Dr. House, we prioritize  your health and wellness, providing a seamless connection to top healthcare providers across all specialties.</p>

<p>With My Dr. House, you can:</p>

<p>.Browse Specialties:  Discover a wide range of specialists, from general practitioners to highly specialized doctors, and choose the best fit for your health needs.</p>

<p>.Book Appointments:  Schedule appointments quickly and easily, helping you manage your healthcare without hassle.</p>

<p>.Access Medical Records:  Securely store and retrieve your medical history, prescriptions, and treatment plans anytime, anywhere.</p>

<p>.Stay Informed:  Receive timely notifications and updates, ensuring you&rsquo;re always in control of your healthcare journey.</p>

<p></p>

<p></p>
""";
