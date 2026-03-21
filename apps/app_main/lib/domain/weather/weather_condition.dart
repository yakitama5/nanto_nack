/// 天気の状態を表すEnum。
///
/// OpenWeather API のレスポンスコードをマッピングして生成する。
enum WeatherCondition {
  /// 晴れ（OpenWeather code: 800）
  sunny,

  /// 曇り（OpenWeather code: 801〜804）
  cloudy,

  /// 雨（OpenWeather code: 200〜599）
  rainy,

  /// 雪（OpenWeather code: 600〜699）
  snowy,
}
