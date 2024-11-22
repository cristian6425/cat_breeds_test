import 'package:cat_breeds/src/features/cat/presentation/widgets/breeds_widget.dart';
import 'package:flutter/material.dart';

class CatListPage extends StatelessWidget {
  const CatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CatsBreeds"),centerTitle: true,),
      body: const BreedsWidget(),
    );
  }
}
