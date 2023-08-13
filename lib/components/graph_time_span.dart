part of akount_test.components;

class GraphTimeSpan extends StatefulWidget {
  const GraphTimeSpan({
    required this.selectedTimeSpan,
    required this.onTimeStampUpdate,
  });

  final String selectedTimeSpan;
  final void Function(String) onTimeStampUpdate;
  @override
  State<GraphTimeSpan> createState() => _GraphTimeSpanState();
}

class _GraphTimeSpanState extends State<GraphTimeSpan> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TimeSpanButton(
              label: '5Y',
              isSelected: widget.selectedTimeSpan == '5Y',
              onPress: widget.onTimeStampUpdate,
            ),
            TimeSpanButton(
              label: '1Y',
              isSelected: widget.selectedTimeSpan == '1Y',
              onPress: widget.onTimeStampUpdate,
            ),
            TimeSpanButton(
              label: '6M',
              isSelected: widget.selectedTimeSpan == '6M',
              onPress: widget.onTimeStampUpdate,
            ),
            TimeSpanButton(
              label: '1M',
              isSelected: widget.selectedTimeSpan == '1M',
              onPress: widget.onTimeStampUpdate,
            ),
            TimeSpanButton(
              label: '1W',
              isSelected: widget.selectedTimeSpan == '1W',
              onPress: widget.onTimeStampUpdate,
            )
          ],
        )
      ],
    );
  }
}

class TimeSpanButton extends StatelessWidget {
  const TimeSpanButton({
    required this.label,
    required this.onPress,
    this.isSelected = false,
    super.key,
  });

  final bool isSelected;
  final String label;
  final void Function(String) onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress(label);
      },
      child: SizedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color:
                isSelected ? AkountColors.junoBlue : AkountColors.akountWhite,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? AkountColors.junoBlue
                  : AkountColors.neutral[10]!,
            ),
          ),
          child: Padding(
            padding: UIPadding.paddingH12,
            child: Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? AkountColors.akountWhite
                    : AkountColors.neutral[50],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
