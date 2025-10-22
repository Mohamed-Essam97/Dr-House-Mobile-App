import 'package:flutter/material.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';

class EmptyWidget extends StatelessWidget {
  final String message;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;

  const EmptyWidget({
    super.key,
    this.message = 'No data available',
    this.icon = Icons.hourglass_empty,
    this.iconSize = 50.0,
    this.iconColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16.0),
          TextUtils(
            message,
            style: context.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
