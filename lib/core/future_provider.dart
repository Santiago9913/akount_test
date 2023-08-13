part of akount_test.core;

final graphDataFutureProvider = FutureProvider<GraphData?>((ref) async {
  return ref.read(akountProvider.notifier).getGraphData();
});

final currentExchangeFutureProvider = FutureProvider<GraphData?>((ref) async {
  return ref.read(akountProvider.notifier).getCurrentExchangeRate();
});
