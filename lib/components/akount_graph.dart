part of akount_test.components;

class AkountGraph extends StatefulWidget {
  const AkountGraph({
    required this.data,
    required this.timeSpan,
    required this.onTimeStampUpdate,
    super.key,
  });

  final List<AkountSpot> data;
  final String timeSpan;
  final void Function(String) onTimeStampUpdate;
  @override
  State<AkountGraph> createState() => _AkountGraphState();
}

class _AkountGraphState extends State<AkountGraph> {
  List<FlSpot> parsedSpots() => widget.data
      .map((e) =>
          FlSpot(e.date.millisecondsSinceEpoch.toDouble(), e.price.toDouble()))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.23,
              child: Padding(
                padding: UIPadding.padding_4,
                child: LineChart(mainData()),
              ),
            ),
            Spacing.spacingV8,
            GraphTimeSpan(
              selectedTimeSpan: widget.timeSpan,
              onTimeStampUpdate: widget.onTimeStampUpdate,
            ),
          ],
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        // drawVerticalLine: true,
        horizontalInterval: 1,
        // verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: AkountColors.neutral[10]!,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: const FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
      ),
      lineBarsData: [
        LineChartBarData(
          spots: parsedSpots(),
          isCurved: true,
          gradient: LinearGradient(
            colors: <Color>[
              AkountColors.junoGreen,
              AkountColors.junoGreen.withOpacity(0.3)
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: <Color>[
                AkountColors.junoGreen,
                AkountColors.junoGreen.withOpacity(0.3)
              ],
            ),
          ),
          color: AkountColors.junoBlue,
          isStrokeJoinRound: true,
        )
      ],
    );
  }
}
