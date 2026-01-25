// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_metro/core/Helper/metro_helper/models/trip_details_model.dart';
// import 'package:go_metro/core/utilities/app_color.dart';
// import 'package:go_metro/core/utilities/app_font_family.dart';
// import 'package:go_metro/core/utilities/app_text_style.dart';
// import 'package:go_metro/core/widgets/app_card.dart';
// import 'package:go_metro/core/widgets/station_row.dart';
// import 'package:go_metro/features/home/controller/trip_cubit/trip_cubit.dart';
// import 'package:go_metro/generated/l10n.dart';

// List<TripDetailsModel> list = [
//   TripDetailsModel(
//     startStation: "dfdssfsf",
//     finalStation: "ssssss",
//     time: 15,
//     ticketPrice: 20,
//     transfer: 1,
//   ),
//   TripDetailsModel(
//     startStation: "dfdssfsf",
//     finalStation: "ssssss",
//     time: 15,
//     ticketPrice: 20,
//     transfer: 1,
//   ),
//   TripDetailsModel(
//     startStation: "dfdssfsf",
//     finalStation: "ssssss",
//     time: 15,
//     ticketPrice: 20,
//     transfer: 1,
//   ),
//   TripDetailsModel(
//     startStation: "dfdssfsf",
//     finalStation: "ssssss",
//     time: 15,
//     ticketPrice: 20,
//     transfer: 1,
//   ),
// ];

// class FavouriteSection extends StatelessWidget {
//   const FavouriteSection({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final s = S.of(context);

//     return AppCard(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: BlocBuilder<TripCubit, TripState>(
//           builder: (context, state) {
//             return Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       s.favTrips,
//                       style: AppTextStyle.semiBold16.copyWith(
//                         fontFamily: AppFontFamily.inter,
//                       ),
//                     ),
//                     !TripCubit.get(context).allFav
//                         ? TextButton(
//                             onPressed: () {},
//                             child: Text(
//                               s.seeAll,
//                               style: AppTextStyle.semiBold14.copyWith(
//                                 color: AppColor.primaryColor,
//                               ),
//                             ),
//                           )
//                         : const SizedBox.shrink(),
//                   ],
//                 ),

//                 ListView.builder(
//                   itemCount: 2,

//                   itemBuilder: (context, index) => Row(
//                     children: [
//                       StationRow(
//                         color: list[index].routes[0][0].lineColor!,
//                         station: list[index].routes[0][0].name!,
//                       ),
//                       const Icon(
//                         Icons.arrow_forward,
//                         color: AppColor.primaryColor,
//                       ),
//                       StationRow(
//                         color: list[index].routes[0][0].lineColor!,
//                         station: list[index].routes[0][0].name!,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
