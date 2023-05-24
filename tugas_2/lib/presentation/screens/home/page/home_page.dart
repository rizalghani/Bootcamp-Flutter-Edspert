import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tugas_2/data/datasource/book_remote_datasource_dio.dart';
import 'package:tugas_2/data/model/book_model.dart';
import 'package:tugas_2/data/repository/book_repository_impl.dart';
import 'package:tugas_2/domain/use_case/get_book_use_case.dart';
import 'package:tugas_2/presentation/screens/detail/page/detail_page.dart';
import 'package:tugas_2/presentation/screens/home/controller/home_controller.dart';
import 'package:tugas_2/presentation/screens/search/page/search_page.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController(
    GetBookUseCase(
      BookRepositoryImpl(BookRemoteDatasourceDio(Dio())
          // BookRemoteDatasourceDio(Dio()),
          // BookRemoteDatasourceHttp(),
          ),
    ),
  );

  void navigateToSearch(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchPage(
          query: _controller.searchController.value.text,
        ),
      ),
    );
  }

  void navigateToDetail(BuildContext context, Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(book: book),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller.getBook();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<HomeController>(
            init: _controller,
            initState: (state) => _controller.getBook(),
            builder: (cont) {
              return Column(
                children: [
                  TextField(
                    controller: _controller.searchController.value,
                    onChanged: (value) => _controller.getSearchQuery(),
                    decoration: InputDecoration(
                      hintText: 'Enter Book to Search and Press Icon Search',
                      suffixIcon: IconButton(
                        onPressed: () => navigateToSearch(context),
                        icon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  if (_controller.books.value.isNotEmpty)
                    Expanded(
                      child: ListView.separated(
                        itemCount: _controller.books.value.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final book = _controller.books.value[index];

                          return InkWell(
                              onTap: () => navigateToDetail(context, book),
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 10),
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
                      ),
                    ),
                  if (_controller.books.value.isEmpty)
                    const Center(child: CircularProgressIndicator())
                ],
              );
            }),
      ),
    );
  }
}
