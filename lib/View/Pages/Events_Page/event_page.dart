import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../HomeLayout_Page/HomeLayout.dart';
import '../Home_Page/Home.dart';

class Events_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeLayout_Screen(),), (route) => false);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.deepOrange,
            ),
          ),
          title: const Text(
            'Events',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SfCalendar(
          view: CalendarView.month,
         todayHighlightColor: Colors.deepOrange,
          dataSource: MeetingDataSource(_getDataSource()),
          monthViewSettings: const MonthViewSettings(

              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        ));
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 4));
    meetings.add(Meeting(
        'Event', startTime, endTime, const Color(0xFFFF6600), false));
    meetings.add(Meeting(
        'Event', startTime, endTime, const Color(0xFFFF6600), false));
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

}