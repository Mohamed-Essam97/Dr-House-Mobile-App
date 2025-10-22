import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor_house_mobile_app/blocs/profile/profile_cubit.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';
import 'package:my_doctor_house_mobile_app/screens/complete_profile_screen/widgets/form_widget.dart';

class PatientQuestionsScreen extends StatefulWidget {
  const PatientQuestionsScreen({super.key});

  @override
  _PatientQuestionsScreenState createState() => _PatientQuestionsScreenState();
}

class _PatientQuestionsScreenState extends State<PatientQuestionsScreen> {
  int currentStep = 0;
  int activeStep = 0;
  int activeStep2 = 0;
  int reachedStep = 0;
  int upperBound = 5;
  double progress = 0.2;

  @override
  Widget build(BuildContext context) {
    final initialValues = {
      // Personal Information
      // 'first_name': 'John',
      // 'last_name': 'Doe',
      // 'gender': 'Male',
      // 'dob': DateTime.parse('1990-01-01'),
      // 'children': false,
      // 'height': 175,
      // 'weight': 70,

      // // Female-specific Questions
      // 'marital_status': 'Single',
      // 'pregnant': false,
      // 'menstrual_issues': false,
      // 'title': 'Software Engineer',
      // 'num_children': 0,
      // 'last_child_birth': '01/01/2020',
      // 'birth_type': 'Normal',

      // // Medical History
      // 'chronic_diseases': false,
      // 'chronic_disease_details': '',
      // 'hospital_admission': false,
      // 'hospital_details': '',

      // // Surgical History
      // 'surgeries': false,
      // 'surgery_details': '',

      // // Medication History
      // 'medications': false,
      // 'medication_details': '',

      // // Allergy History
      // 'food_allergies': 'None',
      // 'drug_allergies': 'None',
      // 'allergy_test': 'Negative',

      // // Family History
      // 'family_diseases': false,
      // 'family_cancer': false,

      // // Personal Habits
      // 'smoker': false,
      // 'smoking_duration': 0,

      // // Alcohol and Lifestyle
      // 'alcohol_history': false,
      // 'sedentary': false,
      // 'stress_type': 'Work-related',
      // 'exercise': true,
      // 'exercise_hours': 5,
    };

    return Scaffold(
      appBar: const CustomAppBar(
        title: TextUtils('Complete your profile'),
      ),
      body: BlocProvider<ProfileCubit>(
        create: (BuildContext context) => ProfileCubit(),
        child: const DynamicForm(),
      ),
    );
  }
}
