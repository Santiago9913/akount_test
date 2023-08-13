part of akount_test.typing;

class AkountSpot {
  final num price;
  final DateTime date;

  const AkountSpot({
    required this.price,
    required this.date,
  });

  factory AkountSpot.fromJson(Map<String, dynamic> json) {
    return AkountSpot(
      price: json['h'] as num,
      date: DateTime.fromMillisecondsSinceEpoch(json['t'] as int),
    );
  }

  @override
  bool operator ==(Object other) =>
      other is AkountSpot &&
      other.runtimeType == runtimeType &&
      other.price == price &&
      other.date == date;

  @override
  int get hashCode => price.hashCode ^ date.hashCode;
}
