import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_doctor_house_mobile_app/app_router.dart';
import 'package:my_doctor_house_mobile_app/domain/models/blog_model.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/images/cached_network_image.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';

class BlogCard extends StatelessWidget {
  final Blog blog;

  const BlogCard({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(AppRouter.blogDetailsScreen, extra: blog);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: UIColor.kGrey, width: 0.4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with specialty tag
            Stack(
              children: [
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
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: UIColor.kPrimaryLight,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TextUtils(blog.specialty,
                        style: context.medium(color: Colors.white, size: 8)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Blog title
                  TextUtils(
                    blog.title,
                    style: context.semiBold(size: 14),
                  ),

                  const SizedBox(height: 14),
                  // Author info, date and views
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Author image and name
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage(blog.doctorImageUrl),
                          ),
                          const SizedBox(width: 8),
                          TextUtils(
                            'Dr. ${blog.doctorName}',
                            style: context.medium(size: 10),
                          ),
                        ],
                      ),

                      // Date and views
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
