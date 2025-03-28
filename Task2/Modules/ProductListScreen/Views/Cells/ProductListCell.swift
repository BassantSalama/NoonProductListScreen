

import UIKit

class ProductListCell: UICollectionViewCell {
    
    static let identifier = "ProductListCell"
    
    
    private let grayContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 4
        return view
    }()
    
    private let badgeLabel: UILabel = {
        let label = PaddedLabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        label.backgroundColor = .darkGray
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        return label
    }()
    
    
    private let favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "heart")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        
        button.tintColor = .gray
        button.backgroundColor = .white
        
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.widthAnchor.constraint(equalToConstant: 31).isActive = true
        button.heightAnchor.constraint(equalToConstant: 31).isActive = true
        
        return button
    }()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let addToCartButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "cart.badge.plus")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        
        
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        return button
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private let isSponseredLbl : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Sponsored"
        label.isHidden = true
        label.textColor = .gray
        return label
    }()
    
   
    
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 1
     
        return label
    }()
    
    
    private let productDetailsabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 1
       
        return label
    }()
    
    
    private let OriginalPrice: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    private let discountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        return label
    }()
    
   
    private let  discountPercentage: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGreen
        return label
    }()
    
    private let rankingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    
    private let deliveryInfo: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    private let isExpress: UILabel = {
           let label = UILabel()
           label.text = "express"
           label.textColor = .black
           label.backgroundColor = .yellow
           label.font = UIFont.boldSystemFont(ofSize: 12)
           label.textAlignment = .center
           label.layer.cornerRadius = 8
           label.layer.masksToBounds = true
           return label
       }()
    
   
    private let deliveryLabel: UILabel = {
           let label = UILabel()
        label.text = "Get it by 19 March"
           label.textColor = .black
           label.font = UIFont.systemFont(ofSize: 12)
           return label
       }()
    
    
    private let detailsStackView: UIStackView = {
           let stackView = UIStackView()
           stackView.axis = .vertical
           stackView.alignment = .leading
           stackView.spacing = 4
           stackView.distribution = .fill
           return stackView
       }()
       
      
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 4
        contentView.backgroundColor = .white
        
        contentView.addSubview(grayContainer)
        contentView.addSubview(detailsStackView)
        
        let subviews = [
            badgeLabel, productImageView, addToCartButton, ratingLabel
        ]
        
        subviews.forEach { grayContainer.addSubview($0) }
        
        contentView.addSubview( favoriteButton)
        
        let labels = [ isSponseredLbl, productNameLabel, productDetailsabel, discountLabel,
                       OriginalPrice,OriginalPrice,discountPercentage,
                       rankingLabel, deliveryInfo, isExpress, deliveryLabel]
        
        labels.forEach {detailsStackView.addArrangedSubview($0) }
        
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        if Bundle.main.path(forResource: "Main", ofType: "storyboardc") != nil {
            
            print("Main.storyboard in the Bundle")
            
        } else{
            print("Main.storyboard Not in the Bundle")
            return nil
        }
        
        super.init(coder: coder)
    }
    
    private func setupConstraints() {
        
        let views = [
            grayContainer, badgeLabel, favoriteButton, productImageView, addToCartButton,
            ratingLabel, detailsStackView, isSponseredLbl, productNameLabel, productDetailsabel,
            OriginalPrice, discountLabel, discountPercentage, rankingLabel,
            deliveryInfo, isExpress, deliveryLabel
        ]
        
        views.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        
        NSLayoutConstraint.activate([
            
            grayContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            grayContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            grayContainer.widthAnchor.constraint(equalToConstant: 180),
            grayContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
           
            
            
            badgeLabel.topAnchor.constraint(equalTo: grayContainer.topAnchor, constant: 12),
            badgeLabel.leadingAnchor.constraint(equalTo: grayContainer.leadingAnchor, constant: 8),
            badgeLabel.heightAnchor.constraint(equalToConstant: 24),
            
            
            
            
            productImageView.topAnchor.constraint(equalTo: badgeLabel.bottomAnchor, constant: 24),
            productImageView.centerXAnchor.constraint(equalTo: grayContainer.centerXAnchor),
            productImageView.widthAnchor.constraint(equalToConstant: 100),
            productImageView.heightAnchor.constraint(equalToConstant: 100),
            
            
            addToCartButton.bottomAnchor.constraint(equalTo: grayContainer.bottomAnchor, constant: -8),
            addToCartButton.trailingAnchor.constraint(equalTo: grayContainer.trailingAnchor, constant: -8),
            
            
            ratingLabel.bottomAnchor.constraint(equalTo: grayContainer.bottomAnchor, constant: -8),
            ratingLabel.leadingAnchor.constraint(equalTo: grayContainer.leadingAnchor, constant: 8),
            
            favoriteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            favoriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            
            
            detailsStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            detailsStackView.leadingAnchor.constraint(equalTo: grayContainer.trailingAnchor, constant: 6),
            detailsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            detailsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    
    func configure(with product: Product) {
        badgeLabel.text = product.badge
        favoriteButton.setImage(product.isFavorite ? UIImage(systemName: "heart") : UIImage(systemName: "heart"), for: .normal)
        productImageView.image = UIImage(named: product.imageName)
        ratingLabel.text = "\(product.rating) ★ (\(product.reviewsCount))"
        if product.isSponserdLabel == true {
            isSponseredLbl.isHidden = false
        }else{
            isSponseredLbl.isHidden = true
        }
     
        productNameLabel.text = product.productNameLabel
        productDetailsabel.text = product.productDetailsabel
        
        let attributedString = NSAttributedString(
            string: product.originalPrice,
            attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue]
        )
        OriginalPrice.attributedText = attributedString
        
        
        discountLabel.text = " EGP \(product.discountedPrice)"
        discountPercentage.text = product.discountPercentage
        rankingLabel.text = product.rankingLabel
        deliveryInfo.text = product.deliveryInfo
        
    }
}
