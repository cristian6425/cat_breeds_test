import 'dart:convert';

import 'package:cat_breeds/src/adapters/http_client.dart';
import 'package:cat_breeds/src/config/config.dart';

class RemoteDataSource {

  final HttpClientAdapter _client = HttpClientAdapter( host: Config.host);

  Future<String> get(String search) async {
    String path = "breeds";
    if (search.isNotEmpty){
      path = "$path/search?q=$search";
    }
    final response = await _client.get(path: path);
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw ArgumentError(response.body);
    }
    return response.body;
  }

  Future<String> getImageUrl(String breedId) async {
    try{
      String path = "images";
      if (breedId.isNotEmpty){
        path = "$path/search?breed_ids=$breedId";
      }
      final response = await _client.get(path: path,headers: {});
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw ArgumentError(response.body);
      }
      return jsonDecode(response.body)[0]["url"];
    }catch(e){
      return "";
    }
  }

}
