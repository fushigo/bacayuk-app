import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/book_viewer_controller.dart';

class BookViewerView extends GetView<BookViewerController> {
  const BookViewerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookViewerView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BookViewerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
