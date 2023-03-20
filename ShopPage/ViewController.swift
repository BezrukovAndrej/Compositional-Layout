import UIKit

class ViewController: UIViewController {
    
    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .none
        collectionView.bounces = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let orderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Оформить заказ", for: .normal)
        button.backgroundColor = .none
        button.tintColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let sections = MockData.shared.pageData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        setDelegate()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(orderButton)
        view.addSubview(collectionView)
        collectionView.register(SaleCollectionViewCell.self, forCellWithReuseIdentifier: "StoriesCollectionViewCell")
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        collectionView.register(NoveltiesCollectionViewCell.self, forCellWithReuseIdentifier: "NoveltiesCollectionViewCell")
        collectionView.register(HeaderSupplemenratyView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderSupplementaryView")
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
//MARK: - Create Layout

extension ViewController {

    private func createLayout() -> UICollectionViewCompositionalLayout {

        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            let section = self.sections[sectionIndex]
            switch section {
            case .sales(_):
                return self.createSalesSection()
            case .category(_):
                return self.createCategorySection()
            case .novelties(_):
                return self.createNoviltiesSection()
            }
        }
    }
    
    private func createLayoutSection(group: NSCollectionLayoutGroup,
                                     behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                                     interGroupSpacing: CGFloat,
                                     supplemenratyItem: [NSCollectionLayoutBoundarySupplementaryItem],
                                     contentItems: Bool) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = interGroupSpacing
        section.boundarySupplementaryItems = supplemenratyItem
        section.supplementariesFollowContentInsets = contentItems
        return section
    }
    
    private func createSalesSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.2)), subitems: [item])
        let section = createLayoutSection(group: group,
                                          behavior: .groupPaging,
                                          interGroupSpacing: 5,
                                          supplemenratyItem: [],
                                          contentItems: false)
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        return section
    }
    
    private func createCategorySection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.1)), subitems: [item])
        group.interItemSpacing = .flexible(10)
        
        let section = createLayoutSection(group: group,
                                          behavior: .none,
                                          interGroupSpacing: 10,
                                          supplemenratyItem: [supplemenratyHeaderItem()],
                                          contentItems: false)
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        return section
    }
    
    private func createNoviltiesSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.45)), subitems: [item])
        let section = createLayoutSection(group: group,
                                          behavior: .continuous,
                                          interGroupSpacing: 10,
                                          supplemenratyItem: [supplemenratyHeaderItem()],
                                          contentItems: false)
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        return section
    }
    
    private func supplemenratyHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(30)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
}

//MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
    
}

//MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        case .sales(let sale):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoriesCollectionViewCell", for: indexPath) as? SaleCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.congigureCell(imageName: sale[indexPath.row].image)
            return cell
        case .category(let category):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(categoryName: category[indexPath.row].title, imageName: category[indexPath.row].image)
            return cell
        case .novelties(let novelties):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NoveltiesCollectionViewCell", for: indexPath) as? NoveltiesCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: novelties[indexPath.row].image)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderSupplementaryView", for: indexPath) as! HeaderSupplemenratyView
            header.configureHeader(categoryName: sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
    
}

//MARK: - Set Constraints
    
extension ViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            orderButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            orderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            orderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            orderButton.heightAnchor.constraint(equalToConstant: 60),
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: orderButton.topAnchor, constant: -10)
        ])
    }
}
