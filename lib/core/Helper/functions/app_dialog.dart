import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_metro/generated/l10n.dart';

void appDialog({required BuildContext context, required String msg}) {
  final s = S.of(context);
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      title: Text(s.enableLocation),
      content: Text(msg),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(ctx);
          },
          child: Text(s.cancel),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(ctx);

            if (s.LocationPermissionRequired == msg) {
              await Geolocator.requestPermission();
            } else if (s.PleaseOpenLocation == msg) {
              await Geolocator.openLocationSettings();
            } else if (s.LocationPermanentlyDenied == msg) {
              await Geolocator.openAppSettings();
            }
          },
          child: Text(s.openSettings),
        ),
      ],
    ),
  );
}
