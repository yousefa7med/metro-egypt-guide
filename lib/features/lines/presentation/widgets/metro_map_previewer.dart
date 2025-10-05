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
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black, // 🔲 لون الإطار
                width: 2, // سمك الإطار
              ),
            ),
            child: Opacity(
              opacity: 0.7,
              child: Image.asset(
                Assets.imagesMetroMap,
                width: 250,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _showZoomableImage(BuildContext context, String imagePath) {
  showGeneralDialog(
    context: context,
    barrierColor: Colors.black.withAlpha(220), // 🔥 خلفية شفافة
    barrierDismissible: true,
    barrierLabel: "PhotoView",
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, anim1, anim2) {
      return Stack(
        children: [
          // 📸 الصورة القابلة للتكبير
          Center(
            child: Hero(
              tag: imagePath,
              child: Material(
                color: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
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
          ),

          // 🔙 زر الرجوع
          Positioned(
            top: 40, // المسافة من الأعلى
            left: 16, // المسافة من اليسار
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
              onPressed: () => Navigator.of(context).pop(),
              tooltip: 'Back',
            ),
          ),
        ],
      );
    },
  );
}
