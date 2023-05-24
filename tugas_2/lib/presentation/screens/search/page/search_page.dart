import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_2/data/datasource/book_search_datasoure_dio.dart';
import 'package:tugas_2/data/model/book_model.dart';
import 'package:tugas_2/data/repository/book_search_repository_impl.dart';
import 'package:tugas_2/domain/use_case/get_book_search_use_case.dart';
import 'package:tugas_2/presentation/screens/detail/page/detail_page.dart';
import 'package:tugas_2/presentation/screens/search/controller/search_controller.dart';

class SearchPage extends StatelessWidget {
  final String query;

  SearchPage({super.key, required this.query});

  final _controller = SearchController(
    GetBookSearchUseCase(
      BookSearchRepositoryImpl(
        BookRemoteSearchDataSource(Dio()),
      ),
    ),
  );

  void navigateToDetail(BuildContext context, Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(book: book),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GetBuilder(
            init: _controller,
            initState: (state) => _controller.getBookSearch(query),
            builder: (context) {
              return Column(
                children: [
                  if (_controller.searchBooks.value.isNotEmpty)
                    Expanded(
                        child: ListView.separated(
                      itemCount: _controller.searchBooks.value.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final book = _controller.searchBooks.value[index];
                        return InkWell(
                            onTap: () => navigateToDetail(context, book),
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(40.0),
                                    child: Image.network('${book.image}',
                                        height: 100.0,
                                        width: 100.0,
                                        fit: BoxFit.cover),
                                  ),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          book.title ?? 'No title',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                            '${book.subtitle != "" ? book.subtitle : 'sry donst have Subtitle'}'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      },
                    )),
                  if (_controller.searchBooks.value.isEmpty)
                    const Center(child: CircularProgressIndicator())
                ],
              );
            }),
      ),
    );
  }
}
