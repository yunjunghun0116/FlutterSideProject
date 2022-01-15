import 'models/gathering.dart';

List<String> getDateTime(String openTime, String endTime) {
  //[날짜 시간 (걸리는시간)]
  if (endTime == '') {
    List<String> _date = openTime.split(' ');
    return [_date[0], _date[1].substring(0,5)];
  }
  List<String> _openDate = openTime.split(' ');
  List<String> _endDate = endTime.split(' ');
  List<String> _returnDate = [];
  if (_openDate[0] == _endDate[0]) {
    _returnDate.add(_openDate[0]);
  } else {
    _returnDate.add('${_openDate[0]}~${_endDate[0]}');
  }
  int _hours =
      DateTime.parse(endTime).difference(DateTime.parse(openTime)).inHours;
  _returnDate.add('${_openDate[1].substring(0,5)}~${_endDate[1].substring(0,5)}');
  _returnDate.add('$_hours시간');
  return _returnDate;
}

List<Gathering> getListWithFilter(List<Gathering> gatheringList, int filter) {
  List<Gathering> _gatheringList = gatheringList.sublist(0);
  switch (filter) {
    case 0:
      _gatheringList.sort(
        (Gathering a, Gathering b) =>
            DateTime.parse(b.endTime != '' ? b.endTime : b.openTime).compareTo(
          DateTime.parse(a.endTime != '' ? a.endTime : a.openTime),
        ),
      );
      return _gatheringList;
    case 1:
      _gatheringList.sort(
        (Gathering a, Gathering b) => DateTime.parse(a.openTime).compareTo(
          DateTime.parse(b.openTime),
        ),
      );
      return _gatheringList;
    default:
      return _gatheringList;
  }
}

String getTime(int time){
  if(time<10){
    return '0$time';
  }else{
    return '$time';
  }
}
