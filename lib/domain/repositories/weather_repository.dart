import 'package:simple_weather/data/remote_data_sources/weather_remote_data_source.dart';
import 'package:simple_weather/domain/models/weather_model.dart';

class WeatherRepository {
  const WeatherRepository(this._weatherRemoteDataSource);

  final WeatherRemoteDataSource _weatherRemoteDataSource;

  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    final weateherJson =
        await _weatherRemoteDataSource.getWeatherJson(city: city);
    if (weateherJson == null) {
      return null;
    }
    final weateherModel = WeatherModel.fromJson(weateherJson);
    return weateherModel;
  }

  Future<WeatherModel?> getLastKnownWeatherModel() async {
    const String? city = null; // TODO: get it from shared_preferences
    if (city == null) {
      return null;
    }
    final weateherJson =
        await _weatherRemoteDataSource.getWeatherJson(city: city);
    if (weateherJson == null) {
      return null;
    }
    final weateherModel = WeatherModel.fromJson(weateherJson);
    return weateherModel;
  }
}