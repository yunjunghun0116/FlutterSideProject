import 'package:flutter/material.dart';
import '../../../utils.dart';

class DetailScreenGatheringDateTime extends StatelessWidget {
  final String openTime;
  final String endTime;
  const DetailScreenGatheringDateTime({
    Key? key,
    required this.openTime,
    required this.endTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _dates = getDateTime(openTime, endTime);
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '모임 정보',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(Icons.event_available),
              const SizedBox(width: 5),
              Text(_dates[0]),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(Icons.timer),
              const SizedBox(width: 5),
              Text(
                '${_dates[1]} / ${_dates.length != 2 ? _dates[2] : '종료시간미정'}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
