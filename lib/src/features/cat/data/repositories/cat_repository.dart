
import 'package:cat_breeds/src/features/cat/data/data_sources/remote_data_source.dart';
import 'package:cat_breeds/src/features/cat/data/models/breed_model.dart';
import '../../domain/repositories/i_cat_repository.dart';

class CatRepository implements ICatRepository {
  final RemoteDataSource _dataSource = RemoteDataSource();

  @override
  Future<List<BreedModel>> getBreeds(String search) async {
    final data = await _dataSource.get(search);
    return BreedModel.breedModelFromJson(data);
  }

  @override
  Future<List<BreedModel>> getImages(List<BreedModel> breeds) async {
    List<Future> futureUrlList = [];
    for (BreedModel breed in breeds){
      futureUrlList.add( _dataSource.getImageUrl(breed.id));
    }
    final urlList = await Future.wait(futureUrlList);
    List<BreedModel> newList = [];
    for(int i = 0; i < urlList.length ; i++){
      var newItem = breeds[i].copyWith(urlImage: urlList[i]);
      newList.add(newItem);
    }
    return newList;
  }
}
