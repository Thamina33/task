import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class DialogHelper {
  static void showErrorDialog(
      {String title = 'Error', String? description = 'Something went wrong'}) {
    QuickAlert.show(
      context: Get.context!,
      type: QuickAlertType.error,
      title: title,
      text: description,
    );
  }

  static void showDialog(
      {String title = '',
      String? description = 'Something went wrong',
      type = QuickAlertType.warning}) {
    QuickAlert.show(
      context: Get.context!,
      type: type,
      title: title,
      text: description,
    );
  }

  //show toast
  //show snack bar
  //show loading
  static void showLoading([String? message]) {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 15),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}

void showCustomToast(String message, {bool isError = false}) {
  message.isNotEmpty
      ? Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: isError ? Colors.red : Colors.green,
          textColor: isError ? Colors.white : Colors.white,
          fontSize: 14.0,
        )
      : '';
}

class SimpleDialogItem extends StatelessWidget {
  final String text;
  final String suffiex;
  final Color color;
  final VoidCallback onPressed;
  final Widget leftWidget;

  const SimpleDialogItem(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color = Colors.deepPurple,
      this.suffiex = "",
      this.leftWidget = const SizedBox(
        width: 0,
      )});

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leftWidget,
          suffiex.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(right: 6, bottom: 2),
                  child: Text(suffiex,
                      style: TextStyle(color: color, fontSize: 14)),
                )
              : Container(),
          Text(text, style: const TextStyle(fontSize: 14, color: Colors.black)),
        ],
      ),
    );
  }
}
