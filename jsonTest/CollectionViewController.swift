import UIKit

class CollectionViewController: UICollectionViewController {
    
    let buttons = Buttons.allCases
    let citys = Citys.allCases
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let weatherVC = segue.destination as! WeatherViewController
        guard let indexPath = collectionView.indexPathsForSelectedItems?.last else { return }
        let city = citys[indexPath.last ?? 0].rawValue
        weatherVC.fetchWeather(link: city)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        buttons.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ButtonsCollectionViewCell
        let button = buttons[indexPath.item] 
        cell.buttonLabel.text = button.rawValue
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goTo", sender: nil)
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 38, height: 100)
    }
}

