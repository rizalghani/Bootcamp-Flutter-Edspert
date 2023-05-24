import 'package:tugas_2/data/datasource/book_search_datasoure_dio.dart';
import 'package:tugas_2/data/model/book_search_response.dart';
import 'package:tugas_2/domain/repository/book_search_repository.dart';

class BookSearchRepositoryImpl implements BookSearchRepository {
  final BookRemoteSearchDataSource _bookRemoteSearchDataSource;

  const BookSearchRepositoryImpl(this._bookRemoteSearchDataSource);

  @override
  Future<BookSearchResponse?> getBookSearch(String isbn13) {
    return _bookRemoteSearchDataSource.getBookSearch(isbn13);
  }
}
