

import UIKit

class FilterView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var expressFilterView: ExpressFilterView!
    private var collectionView: UICollectionView!
    private let viewModel: FilterViewModel
    
    init(viewModel: FilterViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)    
        backgroundColor = .white
        setupExpressFilterView()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupExpressFilterView() {
        expressFilterView = ExpressFilterView()
        expressFilterView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(expressFilterView)
        
        NSLayoutConstraint.activate([
            expressFilterView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            expressFilterView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            expressFilterView.widthAnchor.constraint(equalToConstant: 100),
            expressFilterView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 4
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FiltersCollectionViewCell.self, forCellWithReuseIdentifier: FiltersCollectionViewCell.identifier)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            collectionView.leadingAnchor.constraint(equalTo: expressFilterView.trailingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: 33)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.filters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FiltersCollectionViewCell.identifier, for: indexPath) as! FiltersCollectionViewCell
        cell.configure(with: viewModel.filters[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = FiltersCollectionViewCell(frame: .zero)
        cell.configure(with: viewModel.filters[indexPath.item])

        let targetSize = CGSize(width: UIView.layoutFittingCompressedSize.width, height: 30)
        let size = cell.systemLayoutSizeFitting(targetSize,
                                                withHorizontalFittingPriority: .defaultLow,
                                                verticalFittingPriority: .required)

        return CGSize(width: size.width + 6, height: 30) 
    }

    
    func hideViewWithAnimation(mainCollectionView: UICollectionView) {
        guard !self.isHidden else { return }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
            self.transform = CGAffineTransform(translationX: 0, y: -self.bounds.height) // moves it off-screen.
            mainCollectionView.transform = CGAffineTransform(translationX: 0, y: -self.bounds.height)
        }) { _ in
            // After the animation completes, isHidden = true removes it from rendering and interactions.
            self.isHidden = true
        }
    }
    
    func showViewWithAnimation(mainCollectionView: UICollectionView) {
        guard self.isHidden else { return }
        
        self.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.alpha = 1
            self.transform = .identity
            mainCollectionView.transform = .identity
        }
    }
}
