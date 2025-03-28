
 import UIKit

 final class NavBar: UIView {

    
     private let backButton: UIButton = {
         let button = UIButton(type: .system)
         button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
         button.tintColor = .black
         return button
     }()

   
     private let logoImageView: UIImageView = {
         let imageView = UIImageView(image: UIImage(named: "noon_logo"))
         imageView.contentMode = .scaleAspectFit
         return imageView
     }()

    
     private let searchBackgroundView: UIView = {
         let view = UIView()
         view.backgroundColor = UIColor.systemGray6
         view.layer.cornerRadius = 2
         return view
     }()

    
     private let searchTextField: UITextField = {
         let textField = UITextField()
         textField.placeholder = "Search"
         textField.borderStyle = .none
         textField.backgroundColor = .white
         textField.layer.cornerRadius = 4
         
      
         let iconContainer = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
         
      
         let searchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
         searchIcon.tintColor = .gray
         searchIcon.contentMode = .scaleAspectFit
         searchIcon.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
         
       
         iconContainer.addSubview(searchIcon)
         
         
         textField.leftView = iconContainer
         textField.leftViewMode = .always
         
         return textField
     }()

    
    let toggleButton: UIButton = {
         let button = UIButton(type: .system)
         button.setImage(UIImage(systemName: "list.dash"), for: .normal)
         button.tintColor = .black
     

         return button
     }()

     override init(frame: CGRect) {
         super.init(frame: frame)
         setupUI()
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

     private func setupUI() {
         backgroundColor = .white
        

         
         addSubview(backButton)
         addSubview(logoImageView)
         addSubview(searchBackgroundView)
       
        
         
         searchBackgroundView.addSubview(searchTextField)
         searchBackgroundView.addSubview(toggleButton)

        
         [backButton, logoImageView, searchBackgroundView, toggleButton, searchTextField].forEach {
             $0.translatesAutoresizingMaskIntoConstraints = false
         }

         NSLayoutConstraint.activate([
            
             backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
             backButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
             backButton.widthAnchor.constraint(equalToConstant: 30),
             backButton.heightAnchor.constraint(equalToConstant: 30),

            
             logoImageView.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 6),
             logoImageView.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
             logoImageView.widthAnchor.constraint(equalToConstant: 100),
             logoImageView.heightAnchor.constraint(equalToConstant: 70),

         
             searchBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
             searchBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
             searchBackgroundView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 8),
             searchBackgroundView.heightAnchor.constraint(equalToConstant: 65),

        
             searchTextField.leadingAnchor.constraint(equalTo: searchBackgroundView.leadingAnchor, constant: 16),
             searchTextField.trailingAnchor.constraint(equalTo: toggleButton.leadingAnchor, constant: -8),
             searchTextField.centerYAnchor.constraint(equalTo: searchBackgroundView.centerYAnchor),
             searchTextField.heightAnchor.constraint(equalToConstant: 45),

           
             toggleButton.trailingAnchor.constraint(equalTo: searchBackgroundView.trailingAnchor, constant: -16),
             toggleButton.centerYAnchor.constraint(equalTo: searchBackgroundView.centerYAnchor),
             toggleButton.widthAnchor.constraint(equalToConstant: 40),
             toggleButton.heightAnchor.constraint(equalToConstant: 40)
         ])
     }

    
     func configureActions(backAction: Selector, toggleAction: Selector, target: Any) {
         backButton.addTarget(target, action: backAction, for: .touchUpInside)
         toggleButton.addTarget(target, action: toggleAction, for: .touchUpInside)
     }
 }

 
 
