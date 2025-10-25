import 'package:flutter/material.dart';
import 'package:go_metro/core/Helper/metro_helper/models/line_model.dart';
import 'package:go_metro/core/Helper/metro_helper/models/station_model.dart';
import 'package:go_metro/core/controllers/app_cubit/app_cubit.dart';
import 'package:go_metro/core/widgets/routeViewer.dart';
import 'package:go_metro/core/widgets/station_row.dart';
import 'package:go_metro/generated/l10n.dart';

class LinesViewer extends StatelessWidget {
  const LinesViewer({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      children: [
        _buildExpansionTile(
          line: line1.stations,
          name: s.Line1,
          controller: AppCubit.get(context).lineController1,
          onExpand: () {
            AppCubit.get(context).lineController2.collapse();
            AppCubit.get(context).lineController3.collapse();
          },
        ),
        _buildExpansionTile(
          line: line2.stations,
          name: s.Line2,
          controller: AppCubit.get(context).lineController2,
          onExpand: () {
            AppCubit.get(context).lineController1.collapse();
            AppCubit.get(context).lineController3.collapse();
          },
        ),
        _buildExpansionTile(
          controller: AppCubit.get(context).lineController3,
          onExpand: () {
            AppCubit.get(context).lineController1.collapse();
            AppCubit.get(context).lineController2.collapse();
          },
          line: [
            ...line3Main.stations,
            ...line3Branch1.stations.where((e) => e.name != kitKat.name),
            ...line3Branch2.stations.where((e) => e.name != kitKat.name),
          ],
          name: s.Line3,
        ),
      ],
    );
  }

  Widget _buildExpansionTile({
    required void Function() onExpand,
    required final String name,
    required final List<StationModel> line,
    required final ExpansibleController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        controller: controller,
        onExpansionChanged: (expanded) async {
          if (expanded) {
            onExpand();
          }
        },

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Colors.grey, width: 1),
        ),
        title: StationRow(color: line[0].lineColor!, station: name),
        children: [RouteViewer(route: line)],
      ),
    );
  }
}
