import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    
    @IBOutlet var minTempLabel: UILabel!
    @IBOutlet var maxTempLabel: UILabel!
    @IBOutlet var feelsTempLabel: UILabel!
    
    var weather: WeatherInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        view.backgroundColor = .black
    }
    
}

extension WeatherViewController {
    func fetchWeather(link: String) {
        guard let url = URL(string: link) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                self.weather = try JSONDecoder().decode(WeatherInfo.self, from: data)
                DispatchQueue.main.async {
                    self.setInfo()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    func setInfo() {
        cityLabel.text = weather?.name
        tempLabel.text = String(weather?.main?.temp ?? 999) + " ℃"
        minTempLabel.text = String(weather?.main?.temp_min ?? 999) + " ℃"
        maxTempLabel.text = String(weather?.main?.temp_max ?? 999) + " ℃"
        feelsTempLabel.text = String(weather?.main?.feels_like ?? 999) + " ℃"
        view.backgroundColor = .gray
    }
    
}
