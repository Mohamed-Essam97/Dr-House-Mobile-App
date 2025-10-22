import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_doctor_house_mobile_app/app_router.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/appointments_screen/appointments_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/doctors_screen/doctors_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/home_screen/home_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/more_screen/more_screen.dart';

class MainHomePage extends HookWidget {
  final List<Widget> _screens = [
    const HomeScreen(),
    const DoctorsScreen(),
    const SizedBox(),
    const AppointmentsScreen(),
    const MoreScreen(),
  ];

  MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cIndex = useState(0);

    void incrementTab(index) {
      cIndex.value = index;
    }

    return Scaffold(
      body: _screens[cIndex.value],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          navigationBarTheme: const NavigationBarThemeData(
            elevation: 0,
            surfaceTintColor: Colors.transparent,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(22),
              topRight: Radius.circular(22),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 10,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              currentIndex: cIndex.value,
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              iconSize: 24,
              selectedItemColor: UIColor.kPrimaryLight,
              unselectedItemColor: UIColor.kNavBarIconDisActive,
              showUnselectedLabels: true,
              selectedLabelStyle:
                  context.medium(size: 12)!.copyWith(inherit: true),
              unselectedLabelStyle:
                  context.regular(size: 12)!.copyWith(inherit: true),
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.icons.home.path,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        cIndex.value == 0
                            ? UIColor.kPrimaryLight
                            : UIColor.kNavBarIconDisActive,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      height: 24,
                      Assets.icons.doctor.path,
                      colorFilter: ColorFilter.mode(
                        cIndex.value == 1
                            ? UIColor.kPrimaryLight
                            : UIColor.kNavBarIconDisActive,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Doctors'),
                const BottomNavigationBarItem(icon: SizedBox(), label: ''),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.icons.appointment.path,
                      colorFilter: ColorFilter.mode(
                        cIndex.value == 3
                            ? UIColor.kPrimaryLight
                            : UIColor.kNavBarIconDisActive,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Appointments'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.icons.fiRsAlignLeft.path,
                      colorFilter: ColorFilter.mode(
                        cIndex.value == 4
                            ? UIColor.kPrimaryLight
                            : UIColor.kNavBarIconDisActive,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'More'),
              ],
              onTap: (index) {
                if (index != 2) {
                  incrementTab(index);
                } else if (index == 2) {
                  context.push(AppRouter.scanQR);
                }
              },
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(AppRouter.scanQR);
        },
        tooltip: 'Scan',
        shape: const CircleBorder(),
        elevation: 0,
        backgroundColor: UIColor.kWhite,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: UIColor.kPrimaryLight,
            boxShadow: [
              // BoxShadow(
              //   color: Colors.grey.withOpacity(0.5),
              //   offset: const Offset(0, -2),
              //   blurRadius: 6,
              // ),
              BoxShadow(
                color: const Color(0xFF613EEA).withOpacity(0.7),
                offset: const Offset(0, 3),
                blurRadius: 8,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              Assets.icons.qr.path,
              // fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
