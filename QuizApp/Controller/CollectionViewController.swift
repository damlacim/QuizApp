//
//  CollectionViewController.swift
//  QuizApp
//
//  Created by Damla Çim on 13.03.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

struct Categories {
    let category: String
}

class CollectionViewController: UICollectionViewController {
    
    var category: [Categories] = [Categories]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            
            let rowElements: CGFloat = 2
            let space: CGFloat = 5
            let sumSpace = space * (rowElements - 1)
            let itemSpace = sumSpace / rowElements
            let width = collectionView.frame.width / rowElements - itemSpace
            let height = width
            
            layout.itemSize = CGSize(width: width, height: height)
            // itemlar arası boşluğu ayarlar
            layout.minimumInteritemSpacing = space
            // satırlar arası boşluğu ayarlar
            layout.minimumLineSpacing = space
        }
        
        let cat1 = Categories(category: "Linux")
        let cat2 = Categories(category: "Bash")
        let cat3 = Categories(category: "Docker")
        let cat4 = Categories(category: "SQL")
        let cat5 = Categories(category: "CMS")
        let cat6 = Categories(category: "Code")
        let cat7 = Categories(category: "DevOps")
        let cat8 = Categories(category: "Uncategorized")
        
        category.append(cat1)
        category.append(cat2)
        category.append(cat3)
        category.append(cat4)
        category.append(cat5)
        category.append(cat6)
        category.append(cat7)
        category.append(cat8)

    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        if let customCell = cell as? CollectionViewCell {
            customCell.categoriLabel.text = category[indexPath.row].category
            return customCell
        }
        
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "quiz screen", sender: self)
    }
}
