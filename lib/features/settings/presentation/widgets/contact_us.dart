import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_metro/core/utilities/app_color.dart';
import 'package:go_metro/features/home/presentation/widgets/app_icon.dart';
import 'package:go_metro/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Row(
            spacing: 10,
            children: [
              const Expanded(child: Divider(color: Colors.grey)),
              Text(
                S.of(context).contactUs,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),

              const Expanded(child: Divider(color: Colors.grey)),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppIcon(
              radius: 24,

              icon: IconButton(
                onPressed: () async {
                  await launchUrl(
                    Uri.parse("https://www.linkedin.com/in/1youssef-ahmed/"),
                    mode: LaunchMode.externalApplication,
                  );
                },
                icon: const Icon(
                  FontAwesomeIcons.linkedin,
                  color: Colors.white,
                ),
              ),
              backgroundColorIcon: const Color(0xFF0A66C2),
            ),
            AppIcon(
              radius: 24,
              icon: IconButton(
                onPressed: () async {
                  await launchUrl(
                    Uri.parse('https://github.com/yousefa7med'),
                    mode: LaunchMode.externalApplication,
                  );
                },
                icon: const Icon(FontAwesomeIcons.github, color: Colors.white),
              ),
              backgroundColorIcon: const Color(0xFF24292e),
            ),
            AppIcon(
              radius: 24,

              icon: IconButton(
                onPressed: () async {
                  await launchUrl(
                    Uri.parse('mailto:youssefahmedserag@gmail.com'),
                    mode: LaunchMode.externalApplication,
                  );
                },
                icon: const Icon(
                  FontAwesomeIcons.envelope,
                  color: Colors.white,
                ),
              ),
              backgroundColorIcon: AppColor.primaryColor,
            ),
          ],
        ),
      ],
    );
  }
}
