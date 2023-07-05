import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateTime firstDay = DateTime(now.year - 1, now.month, now.day);
    final DateTime lastDay = DateTime(now.year + 1, now.month, now.day);

    return Scaffold(
      body:
      Padding(
        padding:EdgeInsets.only(left:15,right:15,top:15),
      child:Expanded(
        child: Container(
          width: 400,
          height:327,
          decoration: BoxDecoration(
           // color: Colors.indigoAccent,
              border: const GradientBoxBorder(
                gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Padding(
                padding:EdgeInsets.only(top:5),
                child:Text("My Calender",style:TextStyle(fontSize: 17,fontFamily: "Comforta",color:Color(0xff4961AC))),
              ),

              TableCalendar(
                firstDay: firstDay,
                lastDay: lastDay,
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                startingDayOfWeek: StartingDayOfWeek.monday,
                rowHeight: 28,
                daysOfWeekHeight: 60,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false, // Hide the month changing option
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekendStyle: TextStyle(color: Colors.red),
                ),
                calendarStyle: const CalendarStyle(
                  weekendTextStyle: TextStyle(color: Colors.red),
                  todayDecoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.teal,
                    shape: BoxShape.circle,
                  ),
                ),
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    // Call `setState()` when updating the selected day
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  }
                },
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    // Call `setState()` when updating calendar format
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  // No need to call `setState()` here
                  _focusedDay = focusedDay;
                },
              ),

            ],
          ),
        ),

      ),
      ),
    );
  }
}
