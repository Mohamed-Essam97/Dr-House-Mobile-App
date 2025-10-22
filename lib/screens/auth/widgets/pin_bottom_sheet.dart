import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/buttons/custom_normal_button.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinBottomSheet extends HookWidget {
  final Function(String) onPinComplete;
  final String title;
  final String description;
  final String sendTo;
  final VoidCallback resendOnTap;

  const PinBottomSheet({
    super.key,
    required this.onPinComplete,
    required this.title,
    required this.description,
    required this.sendTo,
    required this.resendOnTap,
  });

  @override
  Widget build(BuildContext context) {
    final pin = useState('');
    final seconds = useState(0);
    final timer = useState<Timer?>(null);

    useEffect(() {
      return () {
        timer.value?.cancel();
      };
    }, []);

    void startTimer() {
      seconds.value = 30;
      timer.value?.cancel();
      timer.value = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (seconds.value > 0) {
          seconds.value--;
        } else {
          timer.cancel();
        }
      });
    }

    // Initialize timer when widget is built
    useEffect(() {
      startTimer();
      return null;
    }, const []);

    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 0.86],
            colors: [
              Color(0xFF0188A4),
              Color(0xFF00333E),
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextUtils(
              title,
              style: context.bold(size: 20, color: UIColor.kWhite),
            ),
            const Gap(16),
            TextUtils(description,
                textAlign: TextAlign.center,
                shouldTrim: false,
                style: context.semiBold(
                    size: 15, color: UIColor.kWhite.withOpacity(.6))),
            const Gap(32),
            TextUtils(
              sendTo,
              textAlign: TextAlign.center,
              style: context.bold(size: 20, color: UIColor.kWhite),
            ),
            const Gap(24),
            PinCodeTextField(
              appContext: context,
              length: 5,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(12),
                fieldHeight: 60,
                fieldWidth: 60,
                activeFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                selectedFillColor: Colors.white,
                activeColor: Colors.white,
                inactiveColor: Colors.white,
                selectedColor: Colors.white,
              ),
              enableActiveFill: true,
              onChanged: (value) => pin.value = value,
              // onCompleted: onPinComplete,
            ),
            TextButton(
              onPressed: seconds.value == 0
                  ? () {
                      startTimer();
                      resendOnTap();
                    }
                  : null,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Resend Code',
                          style: context.bold(size: 17)!.copyWith(
                                color: seconds.value == 0
                                    ? UIColor.kWhite
                                    : UIColor.kWhite.withOpacity(0.5),
                                decoration: TextDecoration.underline,
                                decorationColor: seconds.value == 0
                                    ? UIColor.kWhite
                                    : UIColor.kWhite.withOpacity(0.5),
                              ),
                        ),
                        if (seconds.value > 0)
                          TextSpan(
                            text: ' (${seconds.value}s)',
                            style: context
                                .regular(
                                  size: 15,
                                  color: UIColor.kWhite.withOpacity(0.5),
                                )!
                                .copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      UIColor.kWhite.withOpacity(0.5),
                                ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(12),
            NormalButton(
              onPressed: () {
                if (pin.value.length == 5) {
                  onPinComplete(pin.value);
                }
              },
              text: 'Next',
            ),
            const Gap(12),
          ],
        ),
      ),
    );
  }
}
