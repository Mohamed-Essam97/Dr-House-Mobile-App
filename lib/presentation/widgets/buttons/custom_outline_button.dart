import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/loading/loading_widget.dart';

class CustomOutLineButton extends HookWidget {
  final bool localize;
  final bool busy;
  final bool bold;
  final double? width;
  final double height;
  final double radius;
  final double elevation;
  final String text;
  final Widget? child;
  final Color? textColor;

  final Color? backGroundColor, borderColor;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Function onPressed;
  final bool? disabled;

  const CustomOutLineButton({
    super.key,
    this.busy = false,
    this.localize = true,
    required this.onPressed,
    this.child,
    required this.text,
    this.width,
    this.disabled = false,
    this.backGroundColor,
    this.borderColor = UIColor.kGrey,
    this.height = 50, // Default height
    this.elevation = 0,
    this.textColor,
    this.radius = 10,
    this.margin = const EdgeInsets.symmetric(vertical: 5),
    this.padding = const EdgeInsets.symmetric(
        horizontal: 10, vertical: 12), // Padding adjusted for height
    this.bold = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: SizedBox(
        width: width,
        height: height,
        child: OutlinedButton(
          onPressed: () => onPressed(),
          style: Theme.of(context).outlinedButtonTheme.style!.copyWith(
                side: WidgetStateProperty.all(
                    BorderSide(color: borderColor!, width: 1.0)),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius))),
              ),
          child: child ??
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height < 50 ? 4.0 : 12.0,
                    horizontal: 10.0), // Adjust padding based on height
                child: busy
                    ? LoadingWidget(
                        color: UIColor.kPrimaryLight,
                      )
                    : Text(
                        text,
                        style: context.medium20!.copyWith(
                          color: textColor ?? UIColor.kPrimaryLight,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis, // Handle overflow
                        maxLines: 1,
                        // Limit to one line if height is small
                      ),
              ),
        ),
      ),
    );
  }
}
