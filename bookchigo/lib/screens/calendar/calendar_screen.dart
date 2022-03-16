import 'package:bookchigo/controllers/connect_controller.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CalendarScreen'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            locale: 'ko-KR',
            rowHeight: 80,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                if(day.day.isEven){
                  return Container(
                    margin: const EdgeInsets.all(10),
                    color: Colors.black12,
                  );
                }
                return Container(
                  margin: const EdgeInsets.all(10),
                  color: Colors.redAccent,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ConnectController.to.searchBook(query: '겨울',currentPage: 2);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
