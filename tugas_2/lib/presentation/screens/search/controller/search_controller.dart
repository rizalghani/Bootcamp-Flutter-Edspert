import 'package:get/get.dart';
import 'package:tugas_2/data/model/book_model.dart';
import 'package:tugas_2/domain/use_case/get_book_search_use_case.dart';

class SearchController extends GetxController {
  final GetBookSearchUseCase _getBookSearchUseCase;

  SearchController(this._getBookSearchUseCase);

  Rx<List<Book>> searchBooks = Rx([]);

  void getBookSearch(String isbn13) async {
    final result = await _getBookSearchUseCase.call(isbn13);

    if (result != null) {
      searchBooks(result.books);
      update();
    }
  }
}
