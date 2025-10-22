import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
  });

  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  Size get preferredSize => Size.fromHeight(
        Platform.isAndroid ? (kToolbarHeight + 30) : (kToolbarHeight + 4),
      );

  @override
  Widget build(BuildContext context) {
    final isRTL = Localizations.localeOf(context).languageCode == 'ar';

    return Stack(
      children: [
        Image.asset(
          Assets.images.appBarBlur.path,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          // alignment: Alignment.topCenter,
        ),
        AppBar(
          forceMaterialTransparency: true,
          centerTitle: true,
          title: title,
          actions: actions,
          leadingWidth: 90,
          leading: leading ??
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: Transform.rotate(
                      angle: isRTL ? 3.2 : 0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: UIColor.kGrey,
                            width: 0.4,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            Assets.icons.backArrow.path,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ],
    );
  }
}
