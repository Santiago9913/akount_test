const String API_KEY = String.fromEnvironment('POLYGON_KEY');

const String currencyExcange =
    'aggs/ticker/C:USDCOP/range/1/day/:startDate/:endDate?adjusted=true&limit=1800&apiKey=$API_KEY';
