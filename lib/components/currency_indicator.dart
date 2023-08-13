part of akount_test.components;

class CurrencyIndicator extends StatelessWidget {
  const CurrencyIndicator({
    required this.currency,
    Key? key,
  }) : super(key: key);

  final String currency;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AkountColors.junoBlue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
            padding: UIPadding.paddingH8,
            child: Text(
              currency,
              style: Paragraphs.small.copyWith(
                color: AkountColors.akountWhite,
              ),
            )),
      ),
    );
  }
}
