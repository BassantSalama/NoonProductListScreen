import UIKit

class ExpressFilterView: UIView {
    
    private let checkBox: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)  
        button.tintColor = .systemGray4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let expressLabel: UILabel = {
        let label = UILabel()
        label.text = "express"
        label.font = UIFont.italicSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = UIColor.yellow
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
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
    
    private func setupView() {
        let leftStack = UIStackView(arrangedSubviews: [checkBox, expressLabel, separator])
        leftStack.axis = .horizontal
        leftStack.spacing = 10
        leftStack.alignment = .center
        leftStack.distribution = .fill
        leftStack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(leftStack)
        
        NSLayoutConstraint.activate([
            leftStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            leftStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            leftStack.topAnchor.constraint(equalTo: topAnchor),
            leftStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            checkBox.widthAnchor.constraint(equalToConstant: 20),
            checkBox.heightAnchor.constraint(equalToConstant: 20),
            
            expressLabel.widthAnchor.constraint(equalToConstant: 75),
            expressLabel.heightAnchor.constraint(equalToConstant: 29),
            
            separator.widthAnchor.constraint(equalToConstant: 2),
            separator.heightAnchor.constraint(equalTo: expressLabel.heightAnchor),
            separator.heightAnchor.constraint(equalToConstant: 35)
        ])
        
       
    }
    
    
}


