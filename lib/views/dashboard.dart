part of akount_test.views;

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  String formattedDate(DateTime date) {
    DateFormat formatter = DateFormat('MMM d').add_jm();
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    AkountState state = ref.watch(akountProvider);
    AkountViewModel viewModel = ref.watch(akountProvider.notifier);
    AsyncValue<GraphData?> futureProvider = ref.watch(graphDataFutureProvider);
    AsyncValue<GraphData?> currencyExchaneProvider =
        ref.watch(currentExchangeFutureProvider);

    return Scaffold(
        backgroundColor: AkountColors.akountWhite,
        body: Padding(
          padding: UIPadding.padding_16,
          child: Column(
            children: <Widget>[
              const Row(
                children: <Widget>[Text('Tasa de cambios')],
              ),
              Spacing.spacingV8,
              currencyExchaneProvider.when(
                data: (data) {
                  return SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AkountColors.neutral[10],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: UIPadding.padding_16,
                        child: Column(
                          children: <Widget>[
                            Row(
                              textBaseline: TextBaseline.alphabetic,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                    data?.spots.first.price
                                            .toStringAsFixed(2) ??
                                        '',
                                    style: Headings.h1),
                                Spacing.spacingH8,
                                const CurrencyIndicator(currency: 'cop')
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  '= 1 USD',
                                  style: Paragraphs.medium.copyWith(
                                    color: AkountColors.akountBlack,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  formattedDate(DateTime.now()),
                                  style: const TextStyle(
                                    color: AkountColors.junoBlue,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                error: (error, stackTrace) => const SizedBox.shrink(),
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AkountColors.junoGreen,
                    ),
                  );
                },
              ),
              Spacing.spacingV8,
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: futureProvider.when(
                  data: (spots) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: AkountColors.neutral[10],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                          padding: UIPadding.padding_16,
                          child: AkountGraph(
                            data: state.filterSpotsInTime(spots?.spots ?? []),
                            timeSpan: state.timeSpan,
                            onTimeStampUpdate: viewModel.updateTimeStamp,
                          )),
                    );
                  },
                  error: (error, stackTrace) => const SizedBox.shrink(),
                  loading: () => Center(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AkountColors.neutral[10],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Padding(
                        padding: UIPadding.padding_16,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AkountColors.junoGreen,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
