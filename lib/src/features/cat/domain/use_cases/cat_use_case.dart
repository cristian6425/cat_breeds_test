
import 'package:cat_breeds/src/features/cat/data/models/breed_model.dart';
import 'package:cat_breeds/src/features/cat/domain/repositories/i_cat_repository.dart';

class CatUseCase {
  final ICatRepository _catRepository;

  CatUseCase({required ICatRepository catRepository}) : _catRepository = catRepository;

  Future<List<BreedModel>> getBreeds(String search) async {
    final breeds = await  _catRepository.getBreeds(search);
    return await _catRepository.getImages(breeds);
  }

}
