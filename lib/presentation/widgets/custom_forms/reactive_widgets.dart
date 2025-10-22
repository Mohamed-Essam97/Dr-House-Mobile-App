import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/theme_colors.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/custom_forms/validator_messages.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

enum ReactiveFields {
  TEXT,
  PASSWORD,
  DROP_DOWN,
  DATE_PICKER_FIELD,
  TIME_PICKER_FIELD,
  BIG_TEXT,
}

class ReactiveField extends StatefulWidget {
  final ReactiveFields type;
  final String controllerName;
  final String? label;
  final int? maxLines;
  final Color? hoverColor;
  final double? width;
  final TextInputAction? textInputAction;
  final Map<String, String Function(Object)>? validationMesseges;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;
  final String? hint, radioTitle, radioVal;
  final Color? borderColor, hintColor, textColor, fillColor, enabledBorderColor;
  final bool? secure, autoFocus, filled;
  final bool readOnly;
  final List<dynamic>? itemList;
  final BuildContext? context;
  final VoidCallback? onTap;
  final VoidCallback? onSubmitted;
  final Function? onChanged;
  final TextStyle? labelStyle;
  final Widget? icon, suffixIcon, prefixIcon;
  final Function? function;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onPickDate;
  final DateTime? firstDate, lastDate;
  final bool Function(FormControl<Object?>)? showErrors;

  final Iterable<String>? autofillHints;
  const ReactiveField({
    super.key,
    required this.type,
    this.inputFormatters,
    this.onPickDate,
    this.onChanged,
    this.firstDate,
    this.lastDate,
    required this.controllerName,
    this.label,
    this.validationMesseges,
    this.hint,
    this.labelStyle,
    this.onSubmitted,
    this.function,
    this.hoverColor,
    this.autofillHints,
    this.width = double.infinity,
    this.keyboardType = TextInputType.emailAddress,
    this.secure = false,
    this.autoFocus = false,
    this.readOnly = false,
    this.icon,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.textInputAction,
    this.radioTitle = '',
    this.borderColor = UIColor.kPrimaryLight,
    this.hintColor = Colors.black,
    this.textColor = Colors.black,
    this.fillColor = Colors.transparent,
    this.enabledBorderColor = Colors.white,
    this.maxLines = 1,
    this.filled = false,
    this.radioVal = '',
    this.itemList,
    this.context,
    this.decoration,
    this.showErrors,
  });

  @override
  State<ReactiveField> createState() => _ReactiveFieldState();
}

class _ReactiveFieldState extends State<ReactiveField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: SizedBox(
        height: 46,
        child: buildReactiveField(context, controller),
      ),
    );
  }

  buildReactiveField(BuildContext context, controller) {
    Map<String, String Function(Object)>? validationM =
        widget.validationMesseges ?? constValidationMessages;

    switch (widget.type) {
      case ReactiveFields.TEXT:
        return ReactiveTextField(
          enableInteractiveSelection: true,
          autofillHints: widget.autofillHints,
          formControlName: widget.controllerName,
          validationMessages: validationM,
          keyboardType: widget.keyboardType,
          style: context.medium(
            size: 14,
          ),
          textInputAction: widget.textInputAction,
          maxLines: widget.maxLines,
          autocorrect: false,
          inputFormatters: widget.inputFormatters,
          textCapitalization: TextCapitalization.sentences,
          autofocus: widget.autoFocus!,
          readOnly: widget.readOnly,
          obscureText: widget.secure!,
          cursorColor: context.secondary,
          showErrors: widget.showErrors,
          decoration: widget.decoration ??
              getFilledDecoration(
                hint: widget.hint,
                context: context,
                suffixIcon: widget.suffixIcon,
                prefixIcon: widget.prefixIcon,
              ),
        );

      case ReactiveFields.PASSWORD:
        return ReactiveTextField(
          enableInteractiveSelection: true,
          autofillHints: widget.autofillHints,
          formControlName: widget.controllerName,
          textInputAction: widget.textInputAction,
          validationMessages: validationM,
          keyboardType: TextInputType.visiblePassword,
          style: context.medium(
            size: 14,
          ),
          controller: controller,
          autofocus: widget.autoFocus!,
          readOnly: widget.readOnly,
          obscureText: _obscureText,
          cursorColor: context.secondary,
          showErrors: widget.showErrors,
          decoration: widget.decoration ??
              getFilledDecoration(
                hint: widget.hint,
                context: context,
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(
                    _obscureText
                        ? Assets.icons.eyeDisable.path
                        : Assets.icons.eyeEnable.path,
                    color: UIColor.kGrey,
                    height: 14,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                prefixIcon: null,
              ),
        );

      case ReactiveFields.DROP_DOWN:
        return ReactiveDropdownField<dynamic>(
          hint: TextUtils(widget.hint ?? ""),
          items: widget.itemList!
              .map((item) => DropdownMenuItem<dynamic>(
                    value: item.toString(),
                    child: TextUtils(
                      item,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ))
              .toList(),
          style: context.medium(
            size: 14,
          ),
          icon: const Icon(
            Icons.arrow_drop_down_rounded,
          ),
          // onChanged: onChanged,
          readOnly: widget.readOnly,
          formControlName: widget.controllerName,
          decoration: widget.decoration ??
              getFilledDecoration(
                hint: widget.hint,
                context: context,
                suffixIcon: null,
                prefixIcon: null,
              ),
        );
      case ReactiveFields.DATE_PICKER_FIELD:
        return ReactiveTextField(
          enableInteractiveSelection: true,
          autofillHints: widget.autofillHints,
          formControlName: widget.controllerName,
          validationMessages: validationM,
          keyboardType: widget.keyboardType,
          style: context.medium(
            size: 14,
          ),
          textInputAction: widget.textInputAction,
          maxLines: widget.maxLines,
          autocorrect: false,
          inputFormatters: widget.inputFormatters,
          textCapitalization: TextCapitalization.sentences,
          autofocus: widget.autoFocus!,
          readOnly: widget.readOnly,
          obscureText: widget.secure!,
          cursorColor: context.secondary,
          showErrors: widget.showErrors,
          decoration: widget.decoration ??
              getFilledDecoration(
                hint: widget.hint,
                context: context,
                suffixIcon: null,
                prefixIcon: ReactiveDatePicker(
                  formControlName: widget.controllerName,
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                  initialDate: widget.firstDate ?? DateTime.now(),
                  firstDate: widget.firstDate ?? DateTime.now(),
                  lastDate: DateTime.parse('2080-01-16'),
                  builder: (context, picker, child) {
                    return IconButton(
                      onPressed: widget.onPickDate,
                      icon: Icon(
                        Icons.calendar_month,
                        color: context.secondary,
                      ),
                    );
                  },
                ),
              ),
        );

      case ReactiveFields.TIME_PICKER_FIELD:
        return ReactiveTextField(
          formControlName: widget.controllerName,
          readOnly: true,
          style: context.medium(
            size: 14,
          ),
          enableInteractiveSelection: true,
          autofillHints: widget.autofillHints,
          validationMessages: validationM,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          maxLines: widget.maxLines,
          autocorrect: false,
          inputFormatters: widget.inputFormatters,
          textCapitalization: TextCapitalization.sentences,
          autofocus: widget.autoFocus!,
          obscureText: widget.secure!,
          cursorColor: context.secondary,
          showErrors: widget.showErrors,
          decoration: widget.decoration ??
              getFilledDecoration(
                hint: widget.hint,
                context: context,
                suffixIcon: null,
                prefixIcon: ReactiveTimePicker(
                  formControlName: widget.controllerName,
                  minuteLabelText: "",
                  builder: (context, picker, child) {
                    return IconButton(
                      onPressed: picker.showPicker,
                      icon: Icon(
                        Icons.access_time_outlined,
                        color: context.secondary,
                      ),
                    );
                  },
                ),
              ),
        );
      case ReactiveFields.BIG_TEXT:
        return ReactiveTextField(
          enableInteractiveSelection: true,
          autofillHints: widget.autofillHints,
          formControlName: widget.controllerName,
          validationMessages: validationM,
          keyboardType: widget.keyboardType,
          style: context.medium(
            size: 14,
          ),
          textInputAction: widget.textInputAction,
          maxLines: widget.maxLines,
          autocorrect: false,
          inputFormatters: widget.inputFormatters,
          textCapitalization: TextCapitalization.sentences,
          autofocus: widget.autoFocus!,
          readOnly: widget.readOnly,
          obscureText: widget.secure!,
          cursorColor: context.secondary,
          showErrors: widget.showErrors,
          decoration: widget.decoration ??
              getFilledDecoration(
                hint: widget.hint,
                context: context,
                suffixIcon: null,
                prefixIcon: null,
              ),
        );
    }
  }

  InputDecoration getFilledDecoration({
    String? hint,
    Widget? suffixIcon,
    Widget? prefixIcon,
    required BuildContext context,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: context.description,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      errorStyle: context.errorText!.copyWith(color: UIColor.kError),
      labelStyle: context.label,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: UIColor.kError),
      ),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 4, horizontal: 12), // Add this

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: UIColor.kError),
      ),
    );
  }
}
