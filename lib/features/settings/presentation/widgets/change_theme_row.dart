import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_metro/core/controllers/app_cubit/app_cubit.dart';
import 'package:go_metro/features/settings/presentation/widgets/theme_container.dart';
import 'package:go_metro/generated/l10n.dart';

class ChangeThemeRow extends StatefulWidget {
  const ChangeThemeRow({super.key});

  @override
  State<ChangeThemeRow> createState() => _ChangeThemeRowState();
}

class _ChangeThemeRowState extends State<ChangeThemeRow> {
  late bool isLight;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isLight = Theme.of(context).brightness == Brightness.light;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ThemeContainer(
          icon: const Icon(
            Icons.light_mode_outlined,
            color: Colors.amber,
            size: 34,
          ),
          themeType: S.of(context).Light,
          onTap: () async {
            setState(() {
              isLight = true;
            });
            await AppCubit.get(context).setTheme(ThemeModeState.light);
          },
          isSelected: isLight,
        ),
        const Gap(10),
        ThemeContainer(
          icon: const Icon(
            Icons.dark_mode_outlined,
            size: 34,
            color: Colors.blue,
          ),
          themeType: S.of(context).Dark,

          onTap: () async {
            setState(() {
              isLight = false;
            });
            await AppCubit.get(context).setTheme(ThemeModeState.dark);
          },
          isSelected: !isLight,
        ),
      ],
    );
  }
}
