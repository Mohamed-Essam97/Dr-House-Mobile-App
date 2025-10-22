import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_doctor_house_mobile_app/data/sample_blogs.dart';
import 'package:my_doctor_house_mobile_app/domain/models/blog_model.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/blog_screen/widgets/blog_card_widget.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/blog_screen/widgets/filter_bottom_sheet.dart';

class BlogsScreen extends StatefulWidget {
  const BlogsScreen({super.key});

  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Blog> filteredBlogs =
      sampleBlogs; // You'll need to create this sample data

  void _filterBlogs(String query) {
    setState(() {
      filteredBlogs = sampleBlogs
          .where((blog) =>
              blog.title.toLowerCase().contains(query.toLowerCase()) ||
              blog.specialty.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const TextUtils('Blog'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: InkWell(
              onTap: () {
                showBlogFilterBottomSheet(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: UIColor.kGrey, width: 0.4)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(Assets.icons.filter.path),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Field (same as doctors screen)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
            child: SizedBox(
              height: 46,
              child: TextField(
                controller: _searchController,
                onChanged: _filterBlogs,
                decoration: InputDecoration(
                  hintText: 'Enter your keyword...',
                  hintStyle:
                      context.regular(size: 16, color: UIColor.kDarkGrey),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(14),
                    child: SvgPicture.asset(
                      Assets.icons.search.path,
                      width: 16,
                      height: 16,
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
          // Blogs List
          Expanded(
            child: ListView.builder(
              itemCount: filteredBlogs.length,
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 12),
              itemBuilder: (context, index) {
                final blog = filteredBlogs[index];
                return BlogCard(blog: blog);
              },
            ),
          ),
        ],
      ),
    );
  }
}
