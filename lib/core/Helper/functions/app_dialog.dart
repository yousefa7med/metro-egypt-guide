import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_metro/features/home/controller/trip_cubit/trip_cubit.dart';
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
              Geolocator.openLocationSettings().then(
                (value) => context.read<TripCubit>().getNearestStation(),
              );
            } else if (s.LocationPermanentlyDenied == msg) {
              Geolocator.openAppSettings().then(
                (value) => context.read<TripCubit>().getNearestStation(),
              );
            }
          },
          child: Text(s.openSettings),
        ),
      ],
    ),
  );
}
