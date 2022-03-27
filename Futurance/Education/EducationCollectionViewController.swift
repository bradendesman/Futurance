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
        EducationArticle(title: "Investing 101", author: "Matthew Frenkel", content: "First of all, congratulations! Investing your money is the most reliable way to build wealth over time. If you’re a first-time investor, we’re here to help you get started. It’s time to make your money work for you. \n\nBefore you put your hard-earned cash into an investment vehicle, you’ll need a basic understanding of how to invest your money the right way. Here are some of the best ways to invest money: \n\nHowever, there's no one-size-fits-all answer here. The best way to invest your money is whichever way works best for you. To figure that out, you’ll want to consider your style, your budget, and your risk tolerance.", image: UIImage(systemName: "books.vertical.fill")!, source: "https://www.fool.com/investing/how-to-invest/"),
        EducationArticle(title: "Value Investing", author: "Robin Hartill", content: "Value investors want to buy stocks for less than they're worth. If you could buy $100 bills for $80, wouldn't you do so as often as possible? Here's an overview of value stocks, including some excellent beginner-friendly value stocks, and some key concepts and metrics that value investors should know.\n\nValue stocks are publicly traded companies trading for relatively cheap valuations relative to their earnings and long-term growth potential. \n\nP/E ratio: This is the best-known stock-valuation metric and for a good reason. The price-to-earnings, or P/E, ratio can be a very useful tool for comparing valuations of companies in the same industry. ", image: UIImage(systemName: "books.vertical.fill")!, source: "https://www.fool.com/investing/stock-market/types-of-stocks/value-stocks/"),
        EducationArticle(title: "Growth Investing", author: "Troy Segal", content: "Growth investing is an investment style and strategy that is focused on increasing an investor's capital. Growth investors typically invest in growth stocks—that is, young or small companies whose earnings are expected to increase at an above-average rate compared to their industry sector or the overall market.\n\nGrowth investing is highly attractive to many investors because buying stock in emerging companies can provide impressive returns (as long as the companies are successful). However, such companies are untried, and thus often pose a fairly high risk.\n\nGrowth investing may be contrasted with value investing. Value investing is an investment strategy that involves picking stocks that appear to be trading for less than their intrinsic or book value.", image: UIImage(systemName: "books.vertical.fill")!, source: "https://www.investopedia.com/terms/g/growthinvesting.asp"),
        EducationArticle(title: "ETFs Basics", author: "Wiley Global Finance", content: "Exchange-traded funds are one of the most important and valuable products created for individual investors in recent years. ETFs offer many benefits and, if used wisely, are an excellent vehicle to achieve an investor’s investment goals.\n\nBriefly, an ETF is a basket of securities that you can buy or sell through a brokerage firm on a stock exchange. ETFs are offered on virtually every conceivable asset class from traditional investments to so-called alternative assets like commodities or currencies. In addition, innovative ETF structures allow investors to short markets, to gain leverage, and to avoid short-term capital gains taxes.\n\nAfter a couple of false starts, ETFs began in earnest in 1993 with the product commonly known by its ticker symbol, SPY, or “Spiders,” which became the highest volume ETF in history. In 2021, ETFs are estimated at 5.83 trillion dollars with nearly 2,354 ETF products traded on US stock exchanges.", image: UIImage(systemName: "books.vertical.fill")!, source: "https://www.fidelity.com/learning-center/investment-products/etf/what-are-etfs"),
        EducationArticle(title: "Dividends", author: "Jason Hall", content: "Dividend stocks are stocks that make regular distributions to their shareholders, usually in the form of cash payments. Dividend stocks can be useful sources of income, but the best dividend stocks can also be excellent ways to increase your wealth over the long term.\n\nHowever, not all dividend stocks are great investments, and many investors aren't sure how to start their search. With that in mind, here's a list of dividend-paying stocks you might want to consider and some of the most important things to look for in top dividend stocks.", image: UIImage(systemName: "books.vertical.fill")!, source: "https://www.fool.com/investing/stock-market/types-of-stocks/dividend-stocks/"),
        EducationArticle(title: "Business Risk", author: "US SEC", content: "With a stock, you are purchasing a piece of ownership in a company.  With a bond, you are loaning money to a company.  Returns from both of these investments require that that the company stays in business. If a company goes bankrupt and its assets are liquidated, common stockholders are the last in line to share in the proceeds.  If there are assets, the company’s bondholders will be paid first, then holders of preferred stock.  If you are a common stockholder, you get whatever is left, which may be nothing.\n\nIf you are purchasing an annuity make sure you consider the financial strength of the insurance company issuing the annuity.  You want to be sure that the company will still be around, and financially sound, during your payout phase.", image: UIImage(systemName: "exclamationmark.triangle.fill")!, source: "https://www.investor.gov/introduction-investing/investing-basics/what-risk"),
        EducationArticle(title: "Volatility Risk", author: "US SEC", content: "Even when companies aren’t in danger of failing, their stock price may fluctuate up or down.  Large company stocks as a group, for example, have lost money on average about one out of every three years.  Market fluctuations can be unnerving to some investors.  A stock’s price can be affected by factors inside the company, such as a faulty product, or by events the company has no control over, such as political or market events.", image: UIImage(systemName: "exclamationmark.triangle.fill")!, source: "https://www.investor.gov/introduction-investing/investing-basics/what-risk"),
        EducationArticle(title: "\"Riskless\" Securities", author: "James Chen", content: "While it is true that no investment is fully free of all possible risks, certain securities have so little practical risk that they are considered risk-free or riskless.\n\nRiskless securities often form a baseline for analyzing and measuring risk. These types of investments offer an expected rate of return with very little or no risk. Oftentimes, all types of investors will look to these securities for preserving emergency savings or for holding assets that need to be immediately accessible.\n\nExamples of riskless investments and securities include certificates of deposits (CDs), government money market accounts, and U.S. Treasury bills. The 30-day U.S. Treasury bill is generally viewed as the baseline, risk-free security for financial modeling. It is backed by the full faith and credit of the U.S. government, and, given its relatively short maturity date, has minimal interest rate exposure.", image: UIImage(systemName: "exclamationmark.triangle.fill")!, source: "https://www.investopedia.com/terms/r/risk.asp"),
        EducationArticle(title: "Retirement Basics", author: "Christy Bieber", content: "An IRA is an investment account that provides tax breaks for retirement savings. IRA stands for individual retirement account. There are several different types, but each one allows you to make tax-advantaged contributions from income you earn to build a nest egg for retirement.\n\nThe different kinds of IRAs have different contribution limits, and some also impose income limits on contributors. For example, the two most commonly used IRAs -- traditional and Roth -- have an aggregate contribution limit of $6,000 in 2021 and 2022, although those 50 or older can make an additional catch-up contribution annually. The catch-up contribution amount is $1,000 for 2021 and 2022, so workers 50 and older could contribute a maximum of $7,000 each year.", image: UIImage(systemName: "map.fill")!, source: "https://www.fool.com/retirement/plans/ira/"),
        EducationArticle(title: "Roth IRAs", author: "Troy Segal", content: "A Roth IRA is an individual retirement account (IRA) that allows qualified withdrawals on a tax-free basis if certain conditions are satisfied. Roth IRAs are similar to traditional IRAs, with the biggest distinction being how the two are taxed. Roth IRAs are funded with after-tax dollars—this means that the contributions are not tax-deductible, but once you start withdrawing funds, the money is tax-free.\n\nA Roth IRA is a special individual retirement account where you pay taxes on money going into your account, and then all future withdrawals are tax free\n\nRoth IRAs are best when you think your marginal taxes will be higher in retirement than they are right now.\n\nSingle filers can’t contribute to a Roth IRA if they earn more than $140,000 in 2021 ($144,000 in 2022).", image: UIImage(systemName: "map.fill")!, source: "https://www.investopedia.com/terms/r/rothira.asp"),
        EducationArticle(title: "What is a 401(k)?", author: "Jason Fernando", content: "A 401(k) plan is a retirement savings plan offered by many American employers that has tax advantages to the saver. It is named after a section of the U.S. Internal Revenue Code.\n\nThe employee who signs up for a 401(k) agrees to have a percentage of each paycheck paid directly into an investment account. The employer may match part or all of that contribution. The employee gets to choose among a number of investment options, usually mutual funds.\n\nWith a traditional 401(k), employee contributions are deducted from gross income, meaning the money comes from the employee's payroll before income taxes have been deducted. As a result, the employee's taxable income is reduced by the total amount of contributions for the year and can be reported as a tax deduction for that tax year. No taxes are due on the money contributed or the earnings until the employee withdraws the money, usually in retirement.", image: UIImage(systemName: "map.fill")!, source: "https://www.investopedia.com/terms/1/401kplan.asp"),
        EducationArticle(title: "When to Retire", author: "Kailey Hagan", content: "How much money do you need to comfortably retire? $1 million? $2 million? More?\n\nThe most common rule of thumb is that the average person will need approximately 80% of their pre-retirement income to sustain the same lifestyle after they retire. However, there are several factors to consider, and not all of this income will need to come from your savings. With that in mind, here's a guide to help calculate how much money you will need to retire.\n\nOne important point when it comes to determining your retirement \"number\" is that it isn't about deciding on a certain amount of savings. For example, the most common retirement goal among Americans is a $1 million nest egg. But this is faulty logic.The most important factor in determining how much you need to retire is whether you'll have enough money to create the income you need to support your desired quality of life after you retire.", image: UIImage(systemName: "map.fill")!, source: "https://www.fool.com/retirement/how-much-do-i-need/")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.setCollectionViewLayout(generateLayout(), animated: false)
        collectionView.contentInset.bottom = collectionView.safeAreaInsets.bottom + 60

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
