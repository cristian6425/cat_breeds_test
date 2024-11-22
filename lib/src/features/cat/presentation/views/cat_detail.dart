import 'package:cat_breeds/src/features/cat/data/models/breed_model.dart';
import 'package:cat_breeds/src/utils/constants.dart';
import 'package:cat_breeds/src/utils/extensions.dart';
import 'package:cat_breeds/src/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class CatDetail extends StatelessWidget {
  const CatDetail({super.key, required this.breed});

  final BreedModel breed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breed.name),
        centerTitle: true,
        leading: CustomIconButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(SpaceConstants.small),
        child: Column(
          children: [
            breed.urlImage.isEmpty
                ? _errorImage(context)
                : Image.network(
                    breed.urlImage,
                    fit: BoxFit.contain,
                    height: context.height40,
                    errorBuilder: (context, error, stackTrace) {
                      return _errorImage(context);
                    },
                  ),
            Flexible(
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpaceConstants.medium.heightWidget,
                  _textWithTitle("Description: ", breed.description),
                  SpaceConstants.medium.heightWidget,
                  _textWithTitle("Origin: ", breed.origin),
                  _textWithTitle("Intelligence: ", breed.intelligence.toString()),
                  _textWithTitle("Adaptability: ", breed.adaptability.toString()),
                  _textWithTitle("time span: ", breed.lifeSpan),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _errorImage(BuildContext context) {
    return SizedBox(
        width: context.height40,
        height: context.height40,
        child: const Icon(Icons.image_not_supported, size: 50));
  }

  Widget _textWithTitle(String title, String text) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black),
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: text,
          ),
        ],
      ),
    );
  }
}
