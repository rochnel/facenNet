import 'package:face_net_authentication/domain/entities/enseignant.dart';
import 'package:face_net_authentication/presentation/components/card_enseignant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Rapports extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.orange,
          title: const Text(
            'Rapports',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.05),
        ),
        // child: SingleChildScrollView(
        //   child: Column(children: [
        //     TableCalendar(
        //       calendarStyle: CalendarStyle(
        //           defaultTextStyle: TextStyle(color: Colors.orange)),
        //       onDaySelected: (selectedDay, focusedDay) => print(selectedDay),
        //       availableCalendarFormats: const {CalendarFormat.month: "Month"},
        //       locale: "fr_FR",
        //       firstDay: DateTime.utc(2023, 10, 01),
        //       lastDay: DateTime.utc(2035, 12, 31),
        //       focusedDay: DateTime.now(),
        //     ),
        //     ListView.builder(
        //       physics: const BouncingScrollPhysics(),
        //       shrinkWrap: true,
        //       itemCount: lEnseignant.length,
        //       itemBuilder: (context, index) {
        //         final Ens = lEnseignant[index];
        //         return CardRapport(enseignant: Ens);
        //       },
        //     ),
        //   ]),
        // ),
      ),
    );
  }
}
