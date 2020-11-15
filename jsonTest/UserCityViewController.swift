import UIKit

class UserCityViewController: UIViewController {
    @IBOutlet var userTextField: UITextField!
    
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var minTempLabel: UILabel!
    @IBOutlet var maxTempLabel: UILabel!
    @IBOutlet var feelsTempLabel: UILabel!
    
    private var weather: WeatherInfo?
    private var userCity: String! = ""
    
    override func viewDidLoad() {
        userTextField.delegate = self
    }
    
    @IBAction func userButton(_ sender: UIButton) {
        getCity()
        fetchWeather()
    }
}

extension UserCityViewController {
    private func fetchWeather() {
        guard let url = URL(string: userCity) else { return }
        
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
    
    private func setInfo() {
        tempLabel.text = String(weather?.main?.temp ?? 999) + " ℃"
        minTempLabel.text = String(weather?.main?.temp_min ?? 999) + " ℃"
        maxTempLabel.text = String(weather?.main?.temp_max ?? 999) + " ℃"
        feelsTempLabel.text = String(weather?.main?.feels_like ?? 999) + " ℃"
    }
    
    private func getCity() {
        userCity = "https://api.openweathermap.org/data/2.5/weather?q="
            + (userTextField.text ?? "none")
            + "&units=metric&appid=3a87a7d7754a8701c353366771980046"
    }
}

extension UserCityViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        getCity()
        fetchWeather()
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
