part of akount_test.typing;

class GraphData {
  final List<AkountSpot> spots;

  GraphData({
    required this.spots,
  });

  factory GraphData.fromJson(Map<String, dynamic> json) {
    return GraphData(
        spots: (json['results'] as List<dynamic>)
            .map((value) => AkountSpot.fromJson(value as Map<String, dynamic>))
            .toList());
  }

  @override
  bool operator ==(Object other) =>
      other is GraphData &&
      other.runtimeType == runtimeType &&
      other.spots == spots;

  @override
  int get hashCode => spots.hashCode;
}
