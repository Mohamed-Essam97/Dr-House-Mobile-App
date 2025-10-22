import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor_house_mobile_app/blocs/profile/profile_state.dart';
import 'package:talker/talker.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final talker = Talker();

  ProfileCubit() : super(const ProfileState());

  void updateResponse(String questionId, dynamic value) {
    final updatedResponses = Map<String, dynamic>.from(state.responses);
    updatedResponses[questionId] = value;
    emit(state.copyWith(responses: updatedResponses));
  }

  updateProfilePicture(File file) {
    final updatedResponses = Map<String, dynamic>.from(state.responses);
    updatedResponses['profile_picture'] = file;
    emit(state.copyWith(responses: updatedResponses));
  }

  Future<void> submitProfile() async {
    try {
      // emit(state.copyWith(status: state.loading));

      // Log the data being submitted
      talker.debug('Submitting profile with responses: ${state.responses}');

      // TODO: Add your API call here
      // Example:
      // final response = await profileRepository.updateProfile(state.responses);

      // Simulate API delay
      // await Future.delayed(const Duration(seconds: 2));

      // Log success
      talker.info('Profile updated successfully');

      // emit(state.copyWith(
      //   status: ProfileStatus.success,
      //   message: 'Profile updated successfully',
      // ));
    } catch (error) {
      // Log error
      talker.error('Error updating profile: $error');

      // emit(state.copyWith(
      //   status: ProfileStatus.error,
      //   message: 'Failed to update profile: $error',
      // ));
    }
  }
}
