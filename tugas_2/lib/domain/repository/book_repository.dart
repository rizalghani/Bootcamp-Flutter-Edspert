import 'package:tugas_2/data/model/book_response_model.dart';

abstract class BookRepository {
  Future<BookResponse?> getBook();
}
