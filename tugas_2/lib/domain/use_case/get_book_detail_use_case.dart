import 'package:tugas_2/data/model/book_detail_response.dart';
import 'package:tugas_2/domain/repository/book_detail_repository.dart';

class GetBookDetailUseCase {
  final BookDetailRepository _repository;

  const GetBookDetailUseCase(this._repository);

  Future<BookDetailResponse?> call(String isbn13) async =>
      await _repository.getBookDetail(isbn13);
}
