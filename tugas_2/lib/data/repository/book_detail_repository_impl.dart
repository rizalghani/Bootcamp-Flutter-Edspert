import 'package:tugas_2/data/datasource/book_detail_datasource_dio.dart';
import 'package:tugas_2/data/model/book_detail_response.dart';
import 'package:tugas_2/domain/repository/book_detail_repository.dart';

class BookDetailRepositoryImpl implements BookDetailRepository {
  final BookRemoteDetailDataSource _remoteDetailDataSource;

  const BookDetailRepositoryImpl(this._remoteDetailDataSource);

  @override
  Future<BookDetailResponse?> getBookDetail(isbn13) async {
    return _remoteDetailDataSource.getBookDetail(isbn13);
  }
}
