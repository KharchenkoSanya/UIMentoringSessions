import UIKit

final class OlKha_PetCatrViewController: UIViewController {
    @IBOutlet private weak var mainButton: UIButton!
    @IBOutlet private weak var dogOnTheStreetView: UIView!
    @IBOutlet private weak var willieDogImage: UIImageView!
    @IBOutlet private weak var infoPetCollectionViewCell: UICollectionView!
    private var infoPet: [OlKha_InfoPetViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayoutLabel()
        configureFilterCollection()
        infoPet = infoPetData
    }
    
    private func setupLayoutLabel() {
        willieDogImage.layer.cornerRadius = 32
        dogOnTheStreetView.layer.cornerRadius = 16
        dogOnTheStreetView.backgroundColor = RColor.pinkColor()
        mainButton.layer.cornerRadius = 28
    }
    
    private func blurEffectForView() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = dogOnTheStreetView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        dogOnTheStreetView.addSubview(blurEffectView)
    }
    
    init() {
        super.init(nibName: RNib.olKha_PetCatrViewController.name, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension OlKha_PetCatrViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        infoPet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let info = infoPet[indexPath.row]
        let cell = infoPetCollectionViewCell.dequeueReusableCell(withReuseIdentifier: RNib.olKha_PetInformationCell, for: indexPath)!
        cell.setup(model: info)
        return cell
    }
    
    private func configureFilterCollection() {
        infoPetCollectionViewCell.backgroundColor = RColor.petWhiteColor()
        infoPetCollectionViewCell.register(RNib.olKha_PetInformationCell)
        infoPetCollectionViewCell.dataSource = self
        infoPetCollectionViewCell.delegate = self
    }
}
