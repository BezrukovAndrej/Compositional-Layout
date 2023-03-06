import UIKit

class ViewController: UIViewController {
    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .ypWhite
        collectionView.bounces = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Private Func
    private func setupView() {
        view.backgroundColor = .ypWhite
        title = "Интернет маназин"
    }
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
// MARK: - Properties
private let sections = MockData.shared.pageData

// MARK: - UICollectionViewDelegate
extension UIViewController: UICollectionViewDelegate {
    
}
// MARK: - UICollectionViewDataSource
extension UIViewController: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    }
}

