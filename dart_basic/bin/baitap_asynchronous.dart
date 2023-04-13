import 'dart:convert';

import 'package:http/http.dart' as http;

void main(List<String> args) {
  fetchFromAPI();
}

Future<void> fetchFromAPI() async {
  try {
    const apiKey = '42d4f5e801bbdb3381bc43eac6101205';
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Hanoi&appid=$apiKey&units=metric');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final weather = Weather.fromJson(jsonDecode(response.body));
      print(weather);
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    print(e);
  }
}

class Weather {
  final String cityName;
  final int temp;
  final double feelsLike;
  Weather(
      {required this.cityName, required this.temp, required this.feelsLike});
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        cityName: json['name'],
        temp: json['main']['temp'],
        feelsLike: json['main']['feels_like']);
  }
  @override
  String toString() {
    return 'Weather{cityName: $cityName, temp: $temp, feelsLike: $feelsLike}';
  }
}
