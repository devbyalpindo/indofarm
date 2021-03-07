part of 'services.dart';

class DictionaryServices {

  static Future<List<DictionaryModel>> getDictionary() async {
    try {
      String url = siteURL + 'kamus';
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var token = preferences.getString('token');

      Dio dio = new Dio();
      dio.options.headers["Authorization"] = "Bearer ${token}";
      dio.options.headers["Content-Type"] = "application/json";
      dio.options.headers["Accept"] = "application/json";

      final response = await dio.get(url,
          options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status < 500;
              }));

      if (response.statusCode == 200) {
        final json = response.data;
        List news = json['data'];

        return news.map((e) => DictionaryModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
    }
  }
}