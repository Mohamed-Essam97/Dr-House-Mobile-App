import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:my_doctor_house_mobile_app/app_router.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/buttons/custom_normal_button.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';

class NotificationService {
  // Future<void> init() async {
  //   await Firebase.initializeApp();

  //   FirebaseMessaging messaging = FirebaseMessaging.instance;

  //   await FirebaseMessaging.instance
  //       .setForegroundNotificationPresentationOptions(
  //     alert: true,
  //     badge: true,
  //     sound: true,
  //   );

  //   final settings = await messaging.requestPermission(
  //     alert: true,
  //     badge: true,
  //     sound: true,
  //   );

  //   final notificationCubit = locator<NotificationCubit>();
  //   final communityCubit = locator<CommunityCubit>();
  //   final authCubit = locator<AuthCubit>();

  //   final token = authCubit.state.deviceToken;

  //   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //     if (token.isEmpty) {
  //       final authCubit = locator<AuthCubit>();
  //       final talker = locator<Talker>();

  //       try {
  //         if (Platform.isAndroid) {
  //           final tokenn = await messaging.getToken();
  //           if (tokenn != null) {
  //             talker.info("Device Token : $tokenn");
  //             authCubit.saveDeviceToken(tokenn);
  //           } else {
  //             talker.error("Failed to retrieve device token.");
  //           }
  //         } else if (Platform.isIOS) {
  //           final apnsToken = await messaging.getAPNSToken();
  //           if (apnsToken != null) {
  //             talker.info("APNs Token : $apnsToken");
  //             authCubit.saveDeviceToken(apnsToken);
  //           } else {
  //             talker.error("Failed to retrieve APNs token.");
  //           }
  //         }
  //       } catch (error) {
  //         talker.info("Error : $error");
  //       }
  //     }
  //   }

  //   FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     RemoteNotification? notification = message.notification;

  //     if (notification != null) {
  //       notificationCubit.getUserNotificationsCount();
  //       if (communityCubit.state.properties.isEmpty) {
  //         communityCubit.init();
  //       }

  //       print(notification.body);
  //       operateOnMessage(notification.title!, notification.body!, message.data);
  //     }
  //   });

  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     RemoteNotification? notification = message.notification;
  //     if (notification != null) {
  //       print(notification.body);
  //       notificationCubit.getUserNotificationsCount();

  //       if (communityCubit.state.properties.isEmpty) {
  //         communityCubit.init();
  //       }

  //       operateOnMessage(notification.title!, notification.body!, message.data);
  //     }
  //   });
  // }

  static void showToast(String message, {Toast length = Toast.LENGTH_LONG}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: length,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void errorDialog(String message) {
    // This method needs to be called within a BuildContext
    // You might need to adjust how you access the BuildContext
    BuildContext? context =
        navigatorKey.currentContext; // Get your current BuildContext here

    showDialog(
      context: context!,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(8),
              // SvgPicture.asset(
              //   Assets.icons.errorIcon.path,
              //   height: 60,
              // ),
              const Gap(8),
              TextUtils(
                "Erorr",
                style: context.bodyLarge!.copyWith(
                  color: UIColor.kPrimaryLight,
                  fontSize: 18,
                ),
              ),
              const Gap(4),
              TextUtils(
                message,
                shouldTrim: false,
                textAlign: TextAlign.center,
                style: context.bodyMedium!
                    .copyWith(color: UIColor.kPrimaryLight, fontSize: 12),
              ),
              const Gap(8),
              NormalButton(
                width: 100,
                height: 30,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: 'OK',
              ),
            ],
          ),
        );
      },
    );
  }
}

// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();

//   print('Handling a background message ${message.messageId}');
// }

// operateOnMessage(String mtitle, String mBody, Map<String, dynamic> data) async {
//   await UI.showCustomDialog(
//     navigatorKey.currentState!.context,
//     child: NotificationWidget(
//       title: mtitle,
//       body: mBody,
//       type: "announcements",
//     ),
//   );
// }
