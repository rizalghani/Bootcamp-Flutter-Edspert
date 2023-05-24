import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tugas_2/data/datasource/book_detail_datasource_dio.dart';
import 'package:tugas_2/data/model/book_model.dart';
import 'package:tugas_2/data/repository/book_detail_repository_impl.dart';
import 'package:tugas_2/domain/use_case/get_book_detail_use_case.dart';
import 'package:tugas_2/presentation/screens/detail/controller/detail_controller.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  final Book book;

  DetailPage({super.key, required this.book});

  final _controller = DetailController(
    GetBookDetailUseCase(
      BookDetailRepositoryImpl(
        BookRemoteDetailDataSource(Dio()),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Book'),
      ),
      body: GetBuilder<DetailController>(
        init: _controller,
        initState: (state) => _controller.getDetailBook(book.isbn13 ?? ''),
        builder: (context) {
          return _controller.detailBooks.value.image != null
              ? Padding(
                  padding: const EdgeInsets.all(0),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.network(
                              '${_controller.detailBooks.value.image}',
                              width: 150,
                              height: 150,
                            ),
                            Expanded(
                                child: Text(
                              '${_controller.detailBooks.value.title}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Row(
                                  children: [
                                    const Expanded(child: Text('Subtitle')),
                                    Expanded(
                                        child: Text(
                                            '${_controller.detailBooks.value.subtitle}'))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Row(
                                  children: [
                                    const Expanded(child: Text('Authors')),
                                    Expanded(
                                        child: Text(
                                            '${_controller.detailBooks.value.authors}'))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Row(
                                  children: [
                                    const Expanded(child: Text('Publisher')),
                                    Expanded(
                                        child: Text(
                                            '${_controller.detailBooks.value.publisher}'))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Row(
                                  children: [
                                    const Expanded(child: Text('Language')),
                                    Expanded(
                                        child: Text(
                                            '${_controller.detailBooks.value.language}'))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Row(
                                  children: [
                                    const Expanded(child: Text('Pages')),
                                    Expanded(
                                        child: Text(
                                            '${_controller.detailBooks.value.pages}'))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Row(
                                  children: [
                                    const Expanded(child: Text('Year')),
                                    Expanded(
                                        child: Text(
                                            '${_controller.detailBooks.value.year}'))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Row(
                                  children: [
                                    const Expanded(child: Text('Rating')),
                                    Expanded(
                                        child: Text(
                                            '${_controller.detailBooks.value.rating}'))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Row(
                                  children: [
                                    const Expanded(child: Text('Description')),
                                    Expanded(
                                        child: Text(
                                            '${_controller.detailBooks.value.desc}'))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
