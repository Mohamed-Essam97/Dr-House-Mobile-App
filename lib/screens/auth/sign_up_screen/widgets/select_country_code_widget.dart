import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';

class SelectCountryCodeWidget extends HookWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const SelectCountryCodeWidget({
    super.key,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final countryCode = useState(controller?.text ?? '+20');

    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: UIColor.kWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Flag Dropdown
          CountryCodePicker(
            onChanged: (country) {
              countryCode.value = country.dialCode ?? '';
              // Handle country code change if needed
            },
            initialSelection: 'EG',
            favorite: const ['US', 'UK', 'DE', 'EG'],
            showCountryOnly: true,
            showOnlyCountryWhenClosed: false,
            hideMainText: true,
            padding: EdgeInsets.zero,
            flagWidth: 30,
            showFlag: true,
            flagDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          // Vertical Divider
          Container(
            height: 50,
            width: 1,
            color: UIColor.kDarkGrey.withOpacity(0.2),
          ),
          // Country Code Text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: TextUtils(
              countryCode
                  .value, // You might want to make this dynamic based on selection
              style: context.medium(
                size: 14,
              ),
            ),
          ),
          // Phone Number Input
          Expanded(
            child: TextFormField(
              controller: controller,
              validator: validator,
              keyboardType: TextInputType.phone,
              style: context.medium(
                size: 14,
              ),
              decoration: InputDecoration(
                hintText: "Mobile Number",
                hintStyle: context.description,
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
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 4, horizontal: 12), // Add this

                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: UIColor.kError),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
