import 'package:moneymietest/core/model/error_model.dart';
import 'package:moneymietest/core/model/movie_model.dart';
import 'package:moneymietest/core/services/auth_service.dart';
import 'package:moneymietest/utils/baseModel.dart';
import 'package:moneymietest/utils/helpers.dart';
import 'package:moneymietest/utils/locator.dart';
import 'package:moneymietest/utils/router/navigationService.dart';

class MoviesViewModel extends BaseModel {
  final MovieService _authentication = locator<MovieService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future<List<Results>> fetchMovies() async {
    //setBusy(true);
    var result = await _authentication.getMovies();
    if (result is ErrorModel) {
      // showToast('Login failed');
      print(result.error);
      notifyListeners();
      throw Exception('Failed to load internet');
      //return ErrorModel(result.error);
    }
    print(result);
    return result;
  }
}
