enum Buttons: String, CaseIterable {
    case moscow = "Москва"
    case ufa = "Уфа"
    case mirny = "Мирный"
    case kazan = "Казань"
    case tolyatti = "Тольятти"
}

enum Citys: String, CaseIterable {
    case moscow = "https://api.openweathermap.org/data/2.5/weather?q=Moscow&units=metric&appid=3a87a7d7754a8701c353366771980046"
    case ufa = "https://api.openweathermap.org/data/2.5/weather?q=Ufa&units=metric&appid=3a87a7d7754a8701c353366771980046"
    case mirny = "https://api.openweathermap.org/data/2.5/weather?q=Mirny&units=metric&appid=3a87a7d7754a8701c353366771980046"
    case kazan = "https://api.openweathermap.org/data/2.5/weather?q=Kazan&units=metric&appid=3a87a7d7754a8701c353366771980046"
    case tolyatti = "https://api.openweathermap.org/data/2.5/weather?q=Tolyatti&units=metric&appid=3a87a7d7754a8701c353366771980046"
}

struct Weather: Decodable {
    let temp: Float?
    let temp_min: Float?
    let temp_max: Float?
    let feels_like: Float?
}

struct WeatherInfo: Decodable {
    let name: String?
    var main: Weather?
}


//{
//    "coord": {
//        "lon": 49.35,
//        "lat": 53.53
//    },
//    "main": {
//        "temp": -13,
//        "feels_like": -17.08,
//        "temp_min": -13,
//        "temp_max": -13,
//        "pressure": 1035,
//        "humidity": 84
//    },
//    "timezone": 14400,
//    "id": 482283,
//    "name": "Tolyatti",
//    "cod": 200
//}
