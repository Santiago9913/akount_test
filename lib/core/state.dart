part of akount_test.core;

@immutable
class AkountState {
  const AkountState({this.data, this.timeSpan = '5Y'});

  final GraphData? data;
  final String timeSpan;

  // List<AkountSpot> get filteredSpots {
  //   switch (timeSpan) {
  //     case '5Y':
  //       return data?.spots ?? [];
  //     case '1Y':
  //       return filterSpotsInTime();
  //     case '6M':
  //       return filterSpotsInTime();
  //     case '1M':
  //       return filterSpotsInTime();
  //     default:
  //       throw UnimplementedError();
  //   }
  // }

  List<AkountSpot> filterSpotsInTime(List<AkountSpot> spots) {
    if (timeSpan == '5Y') {
      return spots;
    }

    bool isYear = timeSpan.substring(1) == 'Y';
    bool isMonth = timeSpan.substring(1) == 'M';
    bool isWeek = timeSpan.substring(1) == 'W';
    int target = int.parse(timeSpan[0]);
    DateTime currentTime = DateTime.now();
    List<AkountSpot> filtered = [];
    if (isYear) {
      int targetYear = currentTime.year - target;
      filtered =
          spots.where((element) => element.date.year >= targetYear).toList() ??
              [];
    } else if (isMonth) {
      int targetMonth = currentTime.month - target;

      filtered = spots
              .where((element) =>
                  element.date.month >= targetMonth &&
                  element.date.year == currentTime.year)
              .toList() ??
          [];
    }

    return filtered;
  }

  AkountState copyWith({
    GraphData? data,
    String? timeSpan,
  }) {
    return AkountState(
      data: data ?? this.data,
      timeSpan: timeSpan ?? this.timeSpan,
    );
  }
}
