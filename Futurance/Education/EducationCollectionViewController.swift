//
//  EducationCollectionViewController.swift
//  Futurance
//
//  Created by Braden Desman on 3/27/22.
//

import UIKit

private let reuseIdentifier = "educationArticle"

class EducationCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var articles: [EducationArticle] = [
        EducationArticle(title: "Investing 101", author: "Peter Lynch", content: "First of all, congratulations! Investing your money is the most reliable way to build wealth over time. If you’re a first-time investor, we’re here to help you get started. It’s time to make your money work for you. \n\n Before you put your hard-earned cash into an investment vehicle, you’ll need a basic understanding of how to invest your money the right way. Here are some of the best ways to invest money: \n\n However, there's no one-size-fits-all answer here. The best way to invest your money is whichever way works best for you. To figure that out, you’ll want to consider:", image: UIImage(systemName: "books.vertical.fill")!),
        EducationArticle(title: "Value Investing", author: "Warren Buffet", content: "", image: UIImage(systemName: "books.vertical.fill")!),
        EducationArticle(title: "Growth Investing", author: "Wolf of Wall Street", content: "", image: UIImage(systemName: "books.vertical.fill")!),
        EducationArticle(title: "ETFs Basics", author: "Peter Lynch", content: "", image: UIImage(systemName: "books.vertical.fill")!),
        EducationArticle(title: "Dividends", author: "Warren Buffet", content: "", image: UIImage(systemName: "books.vertical.fill")!),
        EducationArticle(title: "Blue Chip Stocks", author: "Tim Apple", content: "", image: UIImage(systemName: "books.vertical.fill")!),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.setCollectionViewLayout(generateLayout(), animated: false)
    }

    func generateLayout() -> UICollectionViewLayout {
        let spacing = 20
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(100.0), heightDimension: .absolute(170))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: CGFloat(spacing), leading: 0, bottom: CGFloat(spacing), trailing: 0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: CGFloat(spacing), leading: CGFloat(spacing), bottom: CGFloat(spacing), trailing: CGFloat(spacing))
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ArticleViewController else {return}
        guard let sender = sender as? EducationCollectionViewCell else {return}
        destination.article = sender.article
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EducationCollectionViewCell
    
        print("here")
        let article = articles[indexPath.row]
        cell.containerView.layer.cornerRadius = 15.0
        cell.containerView.layer.borderWidth = 0.0
        cell.containerView.layer.shadowColor = UIColor.black.cgColor
        cell.containerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.containerView.layer.shadowRadius = 1.0
        cell.containerView.layer.shadowOpacity = 0.3
        cell.containerView.layer.masksToBounds = false
        cell.titleLabel.text = article.title
        cell.authorLabel.text = article.author
        cell.image.image = article.image
        cell.article = article
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
