import 'package:dio/dio.dart';
import 'package:tugas_2/constants/constants.dart';
import 'package:tugas_2/data/model/book_detail_response.dart';

class BookRemoteDetailDataSource {
  final Dio _client;
  const BookRemoteDetailDataSource(this._client);

  Future<BookDetailResponse?> getBookDetail(String isbn13) async {
    try {
      final url = Constants.detailBookUrl + isbn13;
      final result = await _client.get(url);

      if (result.statusCode == 200) {
        return BookDetailResponse.fromJson(result.data);
      }

      return null;
    } catch (error) {
      return null;
    }
  }
}
