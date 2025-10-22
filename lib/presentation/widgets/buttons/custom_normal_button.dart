import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/loading/loading_widget.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';

class NormalButton extends HookWidget {
  final bool bold;
  final bool busy;
  final double? width;
  final double? height;
  final double radius;
  final double elevation;
  final String? text;
  final TextStyle? textStyle;
  final Widget? child;
  final Color? color;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Function onPressed;
  final Color? textColor;

  const NormalButton({
    super.key,
    this.textStyle,
    this.child,
    required this.onPressed,
    required this.text,
    this.width,
    this.busy = false,
    this.height = 50,
    this.elevation = 0,
    this.radius = 10,
    this.margin = const EdgeInsets.symmetric(vertical: 5),
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
    this.textColor = UIColor.kWhite,
    this.color,
    this.bold = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                backgroundColor: WidgetStateProperty.all(color),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                  ),
                ),
              ),
          onPressed: () => onPressed(),
          child: busy
              ? LoadingWidget(
                  color: UIColor.kBackground,
                )
              : Center(
                  child: TextUtils(
                    text!,
                    style: textStyle ??
                        context.semiBold18!
                            .copyWith(color: textColor, fontSize: 17),
                  ),
                ),
        ),
      ),
    );
  }
}
