part of akount_test.core;

Future<GraphData> getSpots(
  String startDate,
  String endDate,
) async {
  try {
    String parsedUrl = currencyExcange.replaceAll(':startDate', startDate);
    parsedUrl = parsedUrl.replaceAll(':endDate', endDate);
    http.Response response =
        await Service.fetchQuery(HttpMethods.get, parsedUrl);

    if (response.statusCode == 200) {
      return GraphData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error from server');
    }
  } on Exception catch (e) {
    print(e);
    throw Exception('error no funciona');
  }
}
