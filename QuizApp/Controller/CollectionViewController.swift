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
    
    var selectedIndex = 0
    var category: [Categories] = [Categories]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            
            let rowElements : CGFloat = 2
            let space: CGFloat = 5
            let sumSpace = space * (rowElements - 1)
            let itemSpace = sumSpace / rowElements
            let width = collectionView.frame.width / rowElements - itemSpace
            let height = width
            
            layout.itemSize = CGSize(width: width, height: height)
            //itemlar arası boşluğu ayarlar
            layout.minimumInteritemSpacing = space
            //satırlar arası boşluğu ayarlar
            layout.minimumLineSpacing = space
        }
        
        let c1 = Categories(category: "Linux")
        let c2 = Categories(category: "Bash")
        let c3 = Categories(category: "Docker")
        let c4 = Categories(category: "SQL")
        let c5 = Categories(category: "CMS")
        let c6 = Categories(category: "Code")
        let c7 = Categories(category: "DevOps")
        let c8 = Categories(category: "Uncategorized")
        
        category.append(c1)
        category.append(c2)
        category.append(c3)
        category.append(c4)
        category.append(c5)
        category.append(c6)
        category.append(c7)
        category.append(c8)

        
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
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "quiz screen", sender: self)
    }
    
    
}
