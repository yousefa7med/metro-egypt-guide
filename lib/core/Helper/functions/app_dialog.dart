import 'package:flutter/material.dart';

void appDialog({
  required BuildContext context,
  required String msg,
  void Function()? onPressed,
}) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      title: const Text("Enable Location"),
      content: Text(msg),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(ctx);
          },
          child: const Text("Cancel"),
        ),
        TextButton(onPressed: onPressed, child: const Text("Open Settings")),
      ],
    ),
  );
}
