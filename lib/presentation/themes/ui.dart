import 'package:flutter/material.dart';

class UI {
  static Future<dynamic> push(
    BuildContext context,
    Widget page, {
    bool replace = false,
  }) async {
    final route = MaterialPageRoute(builder: (c) => page);

    return replace
        ? await Navigator.pushReplacement(context, route)
        : await Navigator.push(context, route);
  }

  static Future<dynamic> pushReplaceAll(
    BuildContext context,
    Widget page,
  ) async {
    return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }

  static showModalBottomSheetMenu(context, {required Widget child}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12.0),
          ),
        ),
        builder: (builder) => child);
  }

  static showCustomDialog(BuildContext context, {required Widget child}) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.3),
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: child,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
        );
      },
    );
  }

  static unfocus(context) {
    FocusScope.of(context).unfocus();
  }
}

// _showToast({
//   required String icon,
//   required Color primaryColor,
//   required Color lightColor,
//   String? message,
//   String? title,
// }) {
//   showSimpleNotification(
//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SvgPicture.asset(icon),
//               const SizedBox(width: 10),
//               TextUtils(
//                 text: message!,
//                 width: 230,
//                 truncate: false,
//                 textAlign: TextAlign.start,
//                 style: TextStyle(color: primaryColor),
//               ),
//             ],
//           ),
//           TextUtils(
//             text: title ?? "",
//             translateNumber: false,
//             style: const TextStyle(
//               color: Colors.black,
//               fontSize: 14,
//             ),
//           ),
//         ],
//       ),
//     ),
//     position: NotificationPosition.top,
//     background: lightColor,
//   );
// }
