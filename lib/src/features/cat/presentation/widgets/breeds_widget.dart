import 'package:cat_breeds/src/features/cat/data/models/breed_model.dart';
import 'package:cat_breeds/src/features/cat/presentation/cubits/cat_cubit.dart';
import 'package:cat_breeds/src/features/cat/presentation/views/cat_detail.dart';
import 'package:cat_breeds/src/utils/constants.dart';
import 'package:cat_breeds/src/utils/extensions.dart';
import 'package:cat_breeds/src/widgets/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedsWidget extends StatelessWidget {
  const BreedsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CatCubit>();
    return BlocBuilder<CatCubit, CatState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomSearchField(
              onChanged: (value) {
                bloc.searchBreeds(value);
              },
              onClose: () {
                bloc.searchBreeds("");
                FocusScope.of(context).unfocus();
              },
            ),
            if (state.state.isLoading) const Expanded(child: Center(child: CircularProgressIndicator())),
            if (!state.state.isLoading && state.breeds.isEmpty) const Expanded(child: Center(child: Text("No results"))),
            if (!state.state.isLoading && state.breeds.isNotEmpty)
              Flexible(
                child: ListView.builder(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: state.breeds.length,
                  itemBuilder: (BuildContext context, int index) {
                    return card(state.breeds[index], context);
                  },
                ),
              ),
          ],
        );
      },
    );
  }

  Widget card(BreedModel breed, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CatDetail(breed: breed)));
      },
      child: Card(
        margin: const EdgeInsets.all(SpaceConstants.small),
        child: Padding(
          padding: const EdgeInsets.all(SpaceConstants.small),
          child: SizedBox(
            height: context.height40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(breed.name),
                    const Text("More.."),
                  ],
                ),
                breed.urlImage.isEmpty
                    ? _errorImage(context)
                    : Image.network(
                        breed.urlImage,
                        fit: BoxFit.contain,
                        height: context.height30,
                        filterQuality: FilterQuality.low,
                        errorBuilder: (context, error, stackTrace) {
                          return _errorImage(context);
                        },
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(breed.origin),
                    Text("Intelligence: ${breed.intelligence.toString()}"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _errorImage(BuildContext context) {
    return const Expanded(
      child: Icon(Icons.image_not_supported, size: 50),
    );
  }
}
