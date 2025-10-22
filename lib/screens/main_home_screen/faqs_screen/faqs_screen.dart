import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      backgroundColor: UIColor.kWhite,
      appBar: const CustomAppBar(
        title: TextUtils("FAQ"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
            child: SizedBox(
              height: 48,
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Enter your keyword...',
                  hintStyle:
                      context.regular(size: 16, color: UIColor.kDarkGrey),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12),
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
          const Gap(14),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: faqItems.length,
              itemBuilder: (context, index) {
                return FAQItem(
                  question: faqItems[index].question,
                  answer: faqItems[index].answer,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FAQItem extends HookWidget {
  final String question;
  final String answer;

  const FAQItem({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(false);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: UIColor.kGrey,
            width: 0.4,
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            onExpansionChanged: (expanded) {
              isExpanded.value = expanded;
            },
            tilePadding: const EdgeInsets.symmetric(horizontal: 16),
            childrenPadding: const EdgeInsets.only(bottom: 8),
            title: TextUtils(
              question,
              shouldTrim: false,
              style: context.semiBold(size: 15),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                isExpanded.value
                    ? SvgPicture.asset(
                        Assets.icons.minuse.path,
                        height: 16,
                        width: 12,
                        colorFilter: const ColorFilter.mode(
                          UIColor.kPrimaryLight,
                          BlendMode.srcIn,
                        ),
                      )
                    : SvgPicture.asset(
                        Assets.icons.add.path,
                        height: 12,
                        width: 12,
                        colorFilter: const ColorFilter.mode(
                          UIColor.kPrimaryLight,
                          BlendMode.srcIn,
                        ),
                      ),
              ],
            ),
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: TextUtils(
                  shouldTrim: false,
                  answer,
                  style: context.regular(
                    size: 14,
                    color: UIColor.kTextDarkGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Sample FAQ data
class FAQData {
  final String question;
  final String answer;

  FAQData({required this.question, required this.answer});
}

final List<FAQData> faqItems = [
  FAQData(
    question: "How do I book an appointment?",
    answer:
        "You can book an appointment by selecting your preferred doctor and choosing an available time slot that works for you.",
  ),
  FAQData(
    question: "What payment methods are accepted?",
    answer:
        "We accept credit cards, debit cards, and various digital payment methods.",
  ),
  FAQData(
    question: "How can I cancel my appointment?",
    answer:
        "You can cancel your appointment through the 'My Appointments' section up to 24 hours before the scheduled time.",
  ),
  FAQData(
    question: "How can I cancel my appointment?",
    answer:
        "You can cancel your appointment through the 'My Appointments' section up to 24 hours before the scheduled time.",
  ),
  FAQData(
    question: "How can I cancel my appointment?",
    answer:
        "You can cancel your appointment through the 'My Appointments' section up to 24 hours before the scheduled time.",
  ),
  FAQData(
    question: "How can I cancel my appointment?",
    answer:
        "You can cancel your appointment through the 'My Appointments' section up to 24 hours before the scheduled time.",
  ),
  FAQData(
    question: "How can I cancel my appointment?",
    answer:
        "You can cancel your appointment through the 'My Appointments' section up to 24 hours before the scheduled time.",
  ),
  // Add more FAQ items as needed
];
