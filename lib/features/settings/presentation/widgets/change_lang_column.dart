import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:go_metro/core/controllers/app_cubit/app_cubit.dart';
import 'package:go_metro/features/settings/presentation/widgets/lang_container.dart';
import 'package:go_metro/generated/l10n.dart';

class ChangeLangColumn extends StatefulWidget {
  const ChangeLangColumn({super.key});

  @override
  State<ChangeLangColumn> createState() => _ChangeLangColumnState();
}

class _ChangeLangColumnState extends State<ChangeLangColumn> {
  late bool isAarbic;
  @override
  void initState() {
    isAarbic = context.read<AppCubit>().currentLang == "ar";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LangContainer(
          langCode: "En",
          lang: !isAarbic,
          langName: S.of(context).English,
          onTap: () async {
            if (isAarbic) {
              setState(() {
                isAarbic = false;
              });
              await AppCubit.get(context).setLang('en');
            }
          },
        ),
        const Gap(15),
        LangContainer(
          langCode: "Ar",
          lang: isAarbic,
          langName: S.of(context).Arabic,
          onTap: () async {
            if (!isAarbic) {
              setState(() {
                isAarbic = true;
              });
              await AppCubit.get(context).setLang('ar');
            }
          },
        ),
      ],
    );
  }
}
