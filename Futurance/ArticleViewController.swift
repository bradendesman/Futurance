//
//  ArticleViewController.swift
//  Futurance
//
//  Created by Braden Desman on 3/27/22.
//

import UIKit

class ArticleViewController: UIViewController {

    var article: EducationArticle!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var spacer2: UILabel!
    @IBOutlet var sourceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = article.title
        authorLabel.text = article.author
        contentLabel.text = article.content
        sourceLabel.text = article.source
        spacer2.text = ""
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
