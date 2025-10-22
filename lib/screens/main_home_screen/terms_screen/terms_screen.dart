import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColor.kWhite,
      appBar: const CustomAppBar(
        title: TextUtils("Terms of Use"),
      ),
      body: RawScrollbar(
        thumbColor: UIColor.kPrimaryLight,
        trackColor: UIColor.kPrimaryLight.withOpacity(0.6),
        trackBorderColor: UIColor.kPrimaryLight.withOpacity(0.6),
        radius: const Radius.circular(20),
        thickness: 4,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Html(
            data: _termsContent,
          ),
        ),
      ),
    );
  }
}

const String _termsContent = """
<p>Welcome to My Dr. House, your trusted partner in healthcare, designed to make accessing medical services effortless and convenient. At My Dr. House, we prioritize  your health and wellness, providing a seamless connection to top healthcare providers across all specialties.</p>

<p>With My Dr. House, you can:</p>

<p>.Browse Specialties:  Discover a wide range of specialists, from general practitioners to highly specialized doctors, and choose the best fit for your health needs.</p>

<p>.Book Appointments:  Schedule appointments quickly and easily, helping you manage your healthcare without hassle.</p>

<p>.Access Medical Records:  Securely store and retrieve your medical history, prescriptions, and treatment plans anytime, anywhere.</p>

<p>.Stay Informed:  Receive timely notifications and updates, ensuring you&rsquo;re always in control of your healthcare journey.</p>

<p></p>

<p></p>

<p> Welcome to My Dr. House, your trusted partner in healthcare, designed to make accessing medical services effortless and convenient. At My Dr. House, we prioritize  your health and wellness, providing a seamless connection to top healthcare providers across all specialties.</p>

<p>With My Dr. House, you can:</p>

<p>.Browse Specialties:  Discover a wide range of specialists, from general practitioners to highly specialized doctors, and choose the best fit for your health needs.</p>

<p>.Book Appointments:  Schedule appointments quickly and easily, helping you manage your healthcare without hassle.</p>

<p>.Access Medical Records:  Securely store and retrieve your medical history, prescriptions, and treatment plans anytime, anywhere.</p>

<p>.Stay Informed:  Receive timely notifications and updates, ensuring you&rsquo;re always in control of your healthcare journey.</p>

<p></p>

<p></p>

<p> Welcome to My Dr. House, your trusted partner in healthcare, designed to make accessing medical services effortless and convenient. At My Dr. House, we prioritize  your health and wellness, providing a seamless connection to top healthcare providers across all specialties.</p>

<p>With My Dr. House, you can:</p>

<p>.Browse Specialties:  Discover a wide range of specialists, from general practitioners to highly specialized doctors, and choose the best fit for your health needs.</p>

<p>.Book Appointments:  Schedule appointments quickly and easily, helping you manage your healthcare without hassle.</p>

<p>.Access Medical Records:  Securely store and retrieve your medical history, prescriptions, and treatment plans anytime, anywhere.</p>

<p>.Stay Informed:  Receive timely notifications and updates, ensuring you&rsquo;re always in control of your healthcare journey.</p>

<p></p>

<p></p>

<p> Welcome to My Dr. House, your trusted partner in healthcare, designed to make accessing medical services effortless and convenient. At My Dr. House, we prioritize  your health and wellness, providing a seamless connection to top healthcare providers across all specialties.</p>

<p>With My Dr. House, you can:</p>

<p>.Browse Specialties:  Discover a wide range of specialists, from general practitioners to highly specialized doctors, and choose the best fit for your health needs.</p>

<p>.Book Appointments:  Schedule appointments quickly and easily, helping you manage your healthcare without hassle.</p>

<p>.Access Medical Records:  Securely store and retrieve your medical history, prescriptions, and treatment plans anytime, anywhere.</p>

<p>.Stay Informed:  Receive timely notifications and updates, ensuring you&rsquo;re always in control of your healthcare journey.</p>

<p></p>

<p></p>
""";
