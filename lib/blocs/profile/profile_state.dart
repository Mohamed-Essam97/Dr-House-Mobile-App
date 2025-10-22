import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  final Map<String, dynamic> responses;

  const ProfileState({
    this.responses = const {},
  });

  ProfileState copyWith({
    Map<String, dynamic>? responses,
  }) {
    return ProfileState(
      responses: responses ?? this.responses,
    );
  }

  @override
  List<Object> get props => [responses];
}
