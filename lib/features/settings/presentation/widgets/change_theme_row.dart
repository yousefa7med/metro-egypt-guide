
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:metro_egypt_guide/core/controllers/theme_cubit/theme_cubit.dart';
import 'package:metro_egypt_guide/features/settings/presentation/widgets/theme_container.dart';
import 'package:metro_egypt_guide/generated/l10n.dart';

class ChangeThemeRow extends StatefulWidget {
  const ChangeThemeRow({super.key});

  @override
  State<ChangeThemeRow> createState() => _ChangeThemeRowState();
}

class _ChangeThemeRowState extends State<ChangeThemeRow> {
  late bool isLight;
  @override
  void initState() {
    isLight = (AppCubit.get(context).currentTheme == ThemeModeState.light)
        ? true
        : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          onTap: () {
            AppCubit.get(context).setTheme(ThemeModeState.light);
            setState(() {
              isLight = true;
            });
          },
          theme: isLight,
        ),
        const Gap(10),
        ThemeContainer(
          icon: const Icon(
            Icons.dark_mode_outlined,
            size: 34,
            color: Colors.blue,
          ),
          themeType: S.of(context).Dark,

          onTap: () {
            AppCubit.get(context).setTheme(ThemeModeState.dark);
            setState(() {
              isLight = false;
            });
          },
          theme: !isLight,
        ),
      ],
    );
  }
}
