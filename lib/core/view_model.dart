part of akount_test.core;

class AkountViewModel extends StateNotifier<AkountState> {
  AkountViewModel() : super(const AkountState());

  void updateTimeStamp(String timeStamp) {
    state = state.copyWith(timeSpan: timeStamp);
  }

  Future<GraphData> getCurrentExchangeRate() async {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    DateTime currentDate = DateTime.now();

    GraphData data = await getSpots(
      formatter.format(
          DateTime(currentDate.year, currentDate.month, currentDate.day - 1)),
      formatter.format(
          DateTime(currentDate.year, currentDate.month, currentDate.day - 1)),
    );
    return data;
  }

  Future<GraphData?> getGraphData() async {
    try {
      DateFormat formatter = DateFormat('yyyy-MM-dd');
      DateTime currentDate = DateTime.now();
      DateTime startDate =
          DateTime(currentDate.year - 5, currentDate.month, currentDate.day);
      GraphData data = await getSpots(
        formatter.format(startDate),
        formatter.format(currentDate),
      );
      return data;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
