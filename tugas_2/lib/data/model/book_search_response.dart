import 'package:tugas_2/data/model/book_model.dart';

class BookSearchResponse {
  BookSearchResponse({
    this.error,
    this.total,
    this.page,
    this.books,
  });

  final String? error;
  final String? total;
  final String? page;
  final List<Book>? books;

  factory BookSearchResponse.fromJson(Map<String, dynamic> json) =>
      BookSearchResponse(
        error: json["error"],
        total: json["total"],
        page: json["page"],
        books: json["books"] == null
            ? []
            : List<Book>.from(json["books"]!.map((x) => Book.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "total": total,
        "page": page,
        "books": books == null
            ? []
            : List<dynamic>.from(books!.map((x) => x.toJson())),
      };
}
