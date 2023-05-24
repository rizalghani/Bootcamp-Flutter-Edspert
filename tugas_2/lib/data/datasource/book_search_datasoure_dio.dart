import 'package:dio/dio.dart';
import 'package:tugas_2/constants/constants.dart';
import 'package:tugas_2/data/model/book_search_response.dart';

class BookRemoteSearchDataSource {
  final Dio _client;

  const BookRemoteSearchDataSource(this._client);

  Future<BookSearchResponse?> getBookSearch(String isbn13) async {
    try {
      final url = Constants.searchBookRul + isbn13;

      final result = await _client.get(url);

      if (result.statusCode == 200) {
        return BookSearchResponse.fromJson(result.data);
      }

      return null;
    } catch (error) {
      return null;
    }
  }
}
