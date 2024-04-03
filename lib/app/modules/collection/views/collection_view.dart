import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/collection_controller.dart';

class CollectionView extends GetView<CollectionController> {
  const CollectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CollectionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CollectionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
