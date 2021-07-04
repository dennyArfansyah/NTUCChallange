//
//  CarouselController.swift
//  NTUCChallange
//
//  Created by Denny Arfansyah on 02/07/21.
//

import LBTAComponents

class CarouselController: UIViewController {
    
    static let compositionalLayout = UICollectionViewCompositionalLayout { (sectionNumber, env) in
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets.leading = 10
        item.contentInsets.trailing = 10
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(150)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        return section
    }
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: compositionalLayout)
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.backgroundColor = .clear
        pageControl.currentPageIndicatorTintColor = .systemOrange
        pageControl.pageIndicatorTintColor = .white
        return pageControl
    }()
    
    private let totalItems = 5

    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 150)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reusedIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(pageControl)
        pageControl.anchor(nil, left: view.leftAnchor, bottom: collectionView.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 5, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        pageControl.hidesForSinglePage = true
        pageControl.numberOfPages = totalItems
    }
    
}

extension CarouselController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reusedIdentifier, for: indexPath) as! CollectionViewCell
        let images: [UIImage] = [
            UIImage(systemName: "die.face.1.fill"),
            UIImage(systemName: "die.face.2.fill"),
            UIImage(systemName: "die.face.3.fill"),
            UIImage(systemName: "die.face.4.fill"),
            UIImage(systemName: "die.face.5.fill"),
            UIImage(systemName: "die.face.6.fill")
        ].compactMap({ $0 })
        cell.imageView.image = images.randomElement()
        
        let backgounds: [UIColor] = [
            UIColor.gray,
            UIColor.red,
            UIColor.blue,
            UIColor.systemPink,
            UIColor.green,
            UIColor.yellow
        ].compactMap({ $0 })
        cell.contentView.backgroundColor = backgounds.randomElement()
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
    
}
