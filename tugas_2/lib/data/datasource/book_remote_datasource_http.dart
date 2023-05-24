import 'dart:convert';
import 'package:tugas_2/constants/constants.dart';
import 'package:tugas_2/data/datasource/book_remote_datasource.dart';
import 'package:tugas_2/data/model/book_response_model.dart';
import 'package:http/http.dart' as client;

class BookRemoteDatasourceHttp implements BookRemoteDatasource {
  @override
  Future<BookResponse?> getBook() async {
    try {
      final url = Constants.allBookUrl;

      final result = await client.get(Uri.parse(url));

      if (result.statusCode == 200) {
        return BookResponse.fromJson(json.decode(result.body));
      }

      return null;
    } catch (error) {
      return null;
    }
  }
}
