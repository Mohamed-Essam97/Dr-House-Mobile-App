import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';

class Question {
  final String id;
  final String text;
  final String inputType; // 'text', 'number', 'yes_no', 'multiple_choice', etc.
  final List<String>? options; // For multiple-choice questions
  final bool isConditional;
  final String?
      conditionalField; // Field that determines if the question is shown
  final String? icon; // Suffix icon for the question

  Question({
    required this.id,
    required this.text,
    required this.inputType,
    this.options,
    this.isConditional = false,
    this.conditionalField,
    this.icon,
  });
}

final List<Question> questions = [
  // Personal Information
  Question(id: 'first_name', text: 'First name', inputType: 'text'),
  Question(id: 'last_name', text: 'Last name', inputType: 'text'),
  Question(
      id: 'gender',
      text: 'Male or Female?',
      inputType: 'multiple_choice',
      options: ['Male', 'Female'],
      icon: Assets.icons.dropdownIcon.path),
  Question(
    id: 'dob',
    text: 'DD/MM/YYYY',
    inputType: 'date',
    icon: Assets.icons.calender.path,
  ),
  Question(
    id: 'height',
    text: 'Height (in cm)',
    inputType: 'number',
  ),
  Question(
    id: 'weight',
    text: 'Weight (in kg)',
    inputType: 'number',
  ),
  Question(
      id: 'children',
      text: 'Have you had children?',
      inputType: 'yes_no',
      isConditional: true,
      conditionalField: 'gender'),

  // Additional Questions for Females
  Question(
      id: 'marital_status',
      text: 'Single or married?',
      inputType: 'multiple_choice',
      options: ['Single', 'Married'],
      isConditional: true,
      conditionalField: 'gender',
      icon: Assets.icons.dropdownIcon.path),
  Question(
    id: 'pregnant',
    text: 'Are you currently pregnant?',
    inputType: 'yes_no',
    isConditional: true,
    conditionalField: 'gender',
  ),
  Question(
    id: 'menstrual_issues',
    text: 'Have issues with your menstrual cycle?',
    inputType: 'yes_no',
    isConditional: true,
    conditionalField: 'gender',
  ),
  Question(
    id: 'title',
    text: 'Your professional title?',
    inputType: 'text',
  ),

  Question(
      id: 'num_children',
      text: 'How many children have you had?',
      inputType: 'number',
      isConditional: true,
      conditionalField: 'children'),
  Question(
    id: 'last_child_birth',
    text: 'When was your last child born?',
    inputType: 'date',
    isConditional: true,
    conditionalField: 'children',
    icon: Assets.icons.calender.path,
  ),
  Question(
      id: 'birth_type',
      text: 'Was the birth normal or cesarean?',
      inputType: 'multiple_choice',
      options: ['Normal', 'Cesarean'],
      isConditional: true,
      conditionalField: 'children',
      icon: Assets.icons.calender.path),

  // Medical History
  Question(
    id: 'chronic_diseases',
    text: 'Have you been diagnosed with any chronic diseases?',
    inputType: 'yes_no',
  ),
  Question(
      id: 'chronic_disease_details',
      text: 'If yes, what was the diagnosis and when?',
      inputType: 'text',
      isConditional: true,
      conditionalField: 'chronic_diseases'),
  Question(
      id: 'hospital_admission',
      text: 'Have you ever been admitted to the hospital?',
      inputType: 'yes_no'),
  Question(
      id: 'hospital_details',
      text: 'If yes, provide details (reasons, dates, and duration).',
      inputType: 'text',
      isConditional: true,
      conditionalField: 'hospital_admission'),

  // Surgical History
  Question(
      id: 'surgeries',
      text: 'Have you undergone any surgeries?',
      inputType: 'yes_no'),
  Question(
      id: 'surgery_details',
      text: 'If yes, provide details of surgeries and complications.',
      inputType: 'text',
      isConditional: true,
      conditionalField: 'surgeries'),

  // Medication History
  Question(
      id: 'medications',
      text: 'Are you currently taking any medications?',
      inputType: 'yes_no'),
  Question(
      id: 'medication_details',
      text: 'If yes, list medications and dosages.',
      inputType: 'text',
      isConditional: true,
      conditionalField: 'medications'),

  // Allergy History
  Question(
      id: 'food_allergies',
      text: 'Do you have any food allergies?',
      inputType: 'text'),
  Question(
      id: 'drug_allergies',
      text: 'Do you have any drug allergies?',
      inputType: 'text'),
  Question(
      id: 'allergy_test',
      text: 'Have you ever had an allergy test?',
      inputType: 'multiple_choice',
      options: ['Positive', 'Negative'],
      icon: Assets.icons.dropdownIcon.path),

  // Family History
  Question(
    id: 'family_diseases',
    text: 'Is there a family history of chronic diseases?',
    inputType: 'yes_no',
  ),
  Question(
      id: 'family_cancer',
      text: 'Has any family member been diagnosed with cancer?',
      inputType: 'yes_no'),

  // Personal Habits
  Question(id: 'smoker', text: 'Are you a smoker?', inputType: 'yes_no'),
  Question(
      id: 'smoking_duration',
      text: 'If yes, how long have you been smoking?',
      inputType: 'number',
      isConditional: true,
      conditionalField: 'smoker'),

  // Alcohol Consumption
  Question(
      id: 'alcohol_history',
      text: 'Do you have a history of drinking alcohol?',
      inputType: 'yes_no'),

  // Lifestyle
  Question(
      id: 'sedentary',
      text: 'Do you generally live a sedentary lifestyle?',
      inputType: 'yes_no'),
  Question(
      id: 'stress_type',
      text: 'What type of stress do you experience most often?',
      inputType: 'text'),
  Question(
      id: 'exercise', text: 'Do you exercise regularly?', inputType: 'yes_no'),
  Question(
      id: 'exercise_hours',
      text: 'If yes, how many hours per week?',
      inputType: 'number',
      isConditional: true,
      conditionalField: 'exercise'),
];
