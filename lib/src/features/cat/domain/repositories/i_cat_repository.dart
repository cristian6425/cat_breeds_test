
import 'package:cat_breeds/src/features/cat/data/models/breed_model.dart';

abstract class ICatRepository {

  Future<List<BreedModel>> getBreeds(String search);

  Future<List<BreedModel>> getImages(List<BreedModel> breeds);

}
