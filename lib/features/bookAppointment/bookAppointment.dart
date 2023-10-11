import 'dart:math';

import 'package:checkup/features/myCart/bloc/myCart_cubit.dart';
import 'package:checkup/features/service/detailsService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: Colors.white,
  padding: const EdgeInsets.symmetric(horizontal: 8.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
  side: const BorderSide(width: 2.0, color: Colors.indigo),
);

class BookAppointmentView extends StatelessWidget {
  const BookAppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyCartViewCubit>(
      create: (context) => MyCartViewCubit(context.read<DetailsService>()),
      child: const _BookAppointmentView(),
    );
  }
}

class _BookAppointmentView extends StatelessWidget {
  const _BookAppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Appointment'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.more_vert,
                color: Colors.blue,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: BlocConsumer<MyCartViewCubit, MyCartViewState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                      child: Text(
                        'Select Date',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Material(
                        elevation: 8,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: SfDateRangePicker(
                            view: DateRangePickerView.month,
                            selectionMode: DateRangePickerSelectionMode.single,
                            showNavigationArrow: true,
                            showTodayButton: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(4.0, 24.0, 4.0, 4.0),
                      child: Text(
                        'Select Time',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 12.0),
                    sliver: SliverGrid.count(
                      crossAxisCount: 3,
                      children: List.generate(timeRange.length, (index) {
                        return Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              border: Border.all(color: Colors.indigo),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                timeRange[index],
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.indigo,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo[800],
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 16.0),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Confirm',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

List<String> timeRange = [
  '08:00 AM',
  '09:00 AM',
  '10:00 AM',
  '11:00 AM',
  '12:00 PM',
  '01:00 PM',
  '02:00 PM',
  '03:00 PM',
  '04:00 PM',
  '05:00 PM',
  '06:00 PM',
  '07:00 PM'
];

// Widget _buildDefaultRangeDatePickerWithValue(BuildContext context) {
//   DateRangePickerController _controller = DateRangePickerController();
//
//   void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
//     if (args.value is PickerDateRange) {
//       if (args.value.endDate == null) {
//         context.read<BillingViewCubit>().updateCalenderFilterDates(
//             args.value.startDate,
//             DateTime(currentDate.year, currentDate.month, 0));
//       } else {
//         context.read<BillingViewCubit>().updateCalenderFilterDates(
//             args.value.startDate, args.value.endDate);
//       }
//       if (args.value.startDate != null) {
//         context.read<BillingViewCubit>().enableFilterSaveButton();
//       }
//     }
//   }
//
//   return Column(
//     mainAxisSize: MainAxisSize.min,
//     children: [
//       const Padding(
//         padding: EdgeInsets.symmetric(
//             horizontal: UDTspacings.spacingM, vertical: UDTspacings.spacingM),
//         child: Text(
//           'Selecciona el día o periodo de las transacciones que quieres visualizar.',
//           style: UdtTypography.bodyMedium,
//         ),
//       ),
//       const Padding(
//         padding: EdgeInsets.symmetric(vertical: UDTspacings.spacingS),
//         child: Divider(
//           thickness: 1,
//           height: 16,
//           endIndent: UDTspacings.spacingL,
//           indent: UDTspacings.spacingL,
//           color: UdtColors.gray90,
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.symmetric(
//             vertical: UDTspacings.spacingS, horizontal: UDTspacings.spacingL),
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                     left: UDTspacings.spacingXS, bottom: UDTspacings.spacingM),
//                 child: Text(
//                   _invoiceMonthName(0, DateTime.now()),
//                   style: UdtTypography.bodyMediumBold,
//                 ),
//               ),
//             ),
//             SfDateRangePicker(
//               initialSelectedRange: PickerDateRange(
//                   context.read<BillingViewCubit>().state.rangeStartDate,
//                   _endDateCheck(
//                       context.read<BillingViewCubit>().state.rangeEndDate)),
//               selectionMode: DateRangePickerSelectionMode.range,
//               startRangeSelectionColor: UdtColors.blueTrust,
//               endRangeSelectionColor: UdtColors.blueTrust,
//               rangeSelectionColor: UdtColors.blueTrust93,
//               minDate: DateTime(currentDate.year, currentDate.month, 1),
//               maxDate: DateTime(currentDate.year, currentDate.month + 1, 0),
//               controller: _controller,
//               onSelectionChanged: _onSelectionChanged,
//               monthCellStyle: DateRangePickerMonthCellStyle(
//                   todayCellDecoration: BoxDecoration(
//                       color: UdtColors.white100,
//                       border: Border.all(color: UdtColors.white100, width: 1),
//                       shape: BoxShape.circle),
//                   todayTextStyle: const TextStyle(color: UdtColors.gray30)),
//               headerHeight: 0,
//               monthViewSettings: const DateRangePickerMonthViewSettings(
//                   viewHeaderStyle: DateRangePickerViewHeaderStyle(
//                       textStyle: UdtTypography.labelSmallBold)),
//             ),
//           ],
//         ),
//       ),
//       const SizedBox(height: 25),
//     ],
//   );
// }
