import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_doctor_house_mobile_app/blocs/profile/profile_cubit.dart';
import 'package:my_doctor_house_mobile_app/blocs/profile/profile_state.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';

class AddProfilePictureWidget extends HookWidget {
  const AddProfilePictureWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final imageFile = useState<File?>(null);
    final profileCubit = context.read<ProfileCubit>();

    Future<void> pickImage() async {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        imageFile.value = File(image.path);
        await profileCubit.updateProfilePicture(imageFile.value!);
      }
    }

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Center(
          child: Stack(
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: UIColor.kLightGrey.withOpacity(0.4),
                ),
                child: ClipOval(
                  child: imageFile.value != null
                      ? Image.file(
                          imageFile.value!,
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        )
                      : Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            Assets.icons.person.path,
                          ),
                        ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: pickImage,
                  child: Container(
                    width: 27,
                    height: 27,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00718A),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: UIColor.kWhite,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SvgPicture.asset(
                        Assets.icons.addPhoto.path,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
