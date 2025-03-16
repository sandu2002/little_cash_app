import 'package:cash_app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityHistory extends StatefulWidget {
  const ActivityHistory({Key? key}) : super(key: key);

  @override
  _ActivityHistoryState createState() => _ActivityHistoryState();
}

class _ActivityHistoryState extends State<ActivityHistory> {
  @override
  void initState() {
    super.initState();
    userActivities.sort((a, b) => b.date.compareTo(a.date));
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 200),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF0399a7), Color(0xFF5abb39)],
                ).createShader(bounds);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Activity History',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    child: Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            DataTable(
              dataTextStyle: TextStyle(color: Colors.grey.shade600),
              headingRowHeight: 0,
              dataRowHeight: 35.0,
              columns: [
                DataColumn(label: Text('Activity')),
                DataColumn(label: Text('Date'), numeric: true),
              ],
              rows:
                  userActivities
                      .take(5)
                      .map(
                        (e) => DataRow(
                          cells: [
                            DataCell(Text(e.activity)),
                            DataCell(
                              Text(
                                DateFormat(
                                  'MMM d, yyyy',
                                ).format(e.date).toString(),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
