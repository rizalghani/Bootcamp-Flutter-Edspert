import 'package:tugas_2/data/model/book_detail_response.dart';

abstract class BookDetailRepository {
  Future<BookDetailResponse?> getBookDetail(String isbn13);
}
