import UIKit

class ProductListVC: UIViewController {
    
    private let customNavBar = NavBar()
    
    private let filterViewModel = FilterViewModel()
    
    private var isFilterHidden = false
    
    private var lastOffset: CGFloat = 0
    
    private var isScrollingUp = false
    
    private lazy var filterView: FilterView = {
        let view = FilterView(viewModel: filterViewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let viewModel = ProductViewModel()
    private var collectionView: UICollectionView!
    private var isGridView = false 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setNavBar()
        setupFilterView()
        setupCollectionView()
        viewModel.fetchProducts()
    }
    
    
    private func setNavBar() {
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.addSubview(customNavBar)
        
        customNavBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customNavBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customNavBar.heightAnchor.constraint(equalToConstant: 80),
        ])
        
        
        customNavBar.configureActions(
            backAction: #selector(backButtonTapped),
            toggleAction: #selector(toggleViewMode),
            target: self )
        
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func toggleViewMode() {
        isGridView.toggle()
        
        DispatchQueue.main.async {
            self.updateCollectionViewLayout()
            self.collectionView.layoutIfNeeded()
            
        }
        
        
        let newImage = isGridView ? UIImage(systemName: "list.dash") : UIImage(systemName: "square.grid.2x2")
        customNavBar.toggleButton.setImage(newImage, for: .normal)
        
        
        self.collectionView.reloadData()
        
        
    }
    
    
    private func setupFilterView() {
        view.addSubview(filterView)
        
        NSLayoutConstraint.activate([
            
            
            filterView.topAnchor.constraint(equalTo:customNavBar.bottomAnchor, constant: 30),
            filterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filterView.heightAnchor.constraint(equalToConstant: 60)
            
            
        ])}
    
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 6
        layout.minimumInteritemSpacing = 4
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.identifier)
        collectionView.register(ProductListCell.self, forCellWithReuseIdentifier: ProductListCell.identifier)
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: filterView.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        updateCollectionViewLayout()
    }
    
    private func updateCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        let columns: CGFloat = isGridView ? (UIDevice.current.userInterfaceIdiom == .pad ? 3 : 2) : 1
        let spacing: CGFloat = 6
        let totalSpacing = (columns - 1) * spacing
        let itemWidth = (view.frame.width - totalSpacing - 2) / columns
        let itemHeight: CGFloat = isGridView ? 440 : view.frame.height / 3 - 12
        
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 6
        
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { _ in
            self.updateCollectionViewLayout()
        })
    }
}

extension ProductListVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let product = viewModel.product(at: indexPath.row)
        
        if isGridView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as! ProductCell
            cell.configure(with: product)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductListCell.identifier, for: indexPath) as! ProductListCell
            cell.configure(with: product)
            return cell
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y

         
        if offset > lastOffset, offset > 60, !isFilterHidden {
            isFilterHidden = true
            filterView.hideViewWithAnimation(mainCollectionView: collectionView)
        }
        
        
        if offset < lastOffset - 20, isFilterHidden {
            isFilterHidden = false
            filterView.showViewWithAnimation(mainCollectionView: collectionView)
        }

      
        lastOffset = offset
    }
    
}

