
import 'package:flutter/material.dart';
import 'package:metro_egypt_guide/core/utilities/assets.dart';
import 'package:photo_view/photo_view.dart';

class MetroMapPreviewer extends StatelessWidget {
  const MetroMapPreviewer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showZoomableImage(context, Assets.imagesMetroMap);
      },
      child: Hero(
        tag: Assets.imagesMetroMap, // for smooth transition
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            Assets.imagesMetroMap,
            width: 250,
            height: 250,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

void _showZoomableImage(BuildContext context, String imagePath) {
  showGeneralDialog(
    context: context,
    barrierColor: Colors.black.withAlpha(220), // 🔥 شفافية الخلفية
    barrierDismissible: true, // يغلق لما المستخدم يضغط برا الصورة
    transitionDuration: const Duration(milliseconds: 200),
    barrierLabel: "dissmis",
    pageBuilder: (context, anim1, anim2) {
      return Center(
        child: Hero(
          tag: imagePath,
          child: Material(
            color: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: PhotoView(
                  imageProvider: AssetImage(imagePath),
                  backgroundDecoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered * 3,
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
