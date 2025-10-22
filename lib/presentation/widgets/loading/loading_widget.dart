import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';

// ignore: must_be_immutable
class LoadingWidget extends HookWidget {
  LoadingWidget({super.key, this.color, this.size});

  Color? color;
  double? size;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 1200),
    );

    return Center(
        child: SpinKitPulse(
      color: UIColor.kPrimaryLight,
      size: 50.0,
      controller: controller,
    ));
  }
}
