import UIKit

class NoveltiesCollectionViewCell: UICollectionViewCell {
    
    private let noveltiesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "ADASda")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let backgroundTitleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Акция на новинки"
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
       let label = UILabel()
        label.text = "10 %"
        label.textAlignment = .center
        label.font = UIFont(name: "Arial Bold", size: 24)
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        clipsToBounds = true
        layer.cornerRadius = 10
        
        addSubview(noveltiesImageView)
        addSubview(backgroundTitleView)
        addSubview(nameLabel)
        addSubview(priceLabel)
    }
    
    func configureCell(imageName: String) {
        noveltiesImageView.image = UIImage(named: imageName)
    }
//MARK: - Set Constraints
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            noveltiesImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            noveltiesImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            noveltiesImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            noveltiesImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            
            backgroundTitleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundTitleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundTitleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundTitleView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            
            nameLabel.centerYAnchor.constraint(equalTo: backgroundTitleView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: backgroundTitleView.leadingAnchor, constant: 10),
            
            priceLabel.centerYAnchor.constraint(equalTo: backgroundTitleView.centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: backgroundTitleView.trailingAnchor, constant: -10)
        ])
    }
}
