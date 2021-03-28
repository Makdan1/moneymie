import 'package:moneymietest/core/model/error_model.dart';
import 'package:moneymietest/core/model/movie_model.dart';

import 'package:moneymietest/core/services/index.dart';
import 'package:moneymietest/utils/helpers.dart';
import 'package:moneymietest/utils/http/api_keys.dart';
import 'package:moneymietest/utils/http/paths.dart';

class MovieService {


  getMovies() async {
    try {
      final result = await http.get(Paths.FETCH_MOVIES + apiKey);
      if (result is ErrorModel) {
        print("ERROR");
        showErrorToast('Fetch failed');
        print(result.error);
        var data = result.error;
        List<Results> postList = List<Results>.from(
            data.map((item) => MovieModel.fromJson(item)));
         return ErrorModel(postList);

      }

      var data = result.data['results'];
      // var list = (data as List)
      //     .map((item) => new PlaceholderModel.fromJson(item))
      //     .toList();
     // print(list.runtimeType);
      //return list;
      List<Results> movieList = List<Results>.from(
          data.map((item) => Results.fromJson(item)));
      return movieList;
    } catch (e) {
      print(e.toString());
      return ErrorModel('$e');
    }
  }
}
