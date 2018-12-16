//
//  ProductDetailViewController.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Elissa Software on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import FSPagerView

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var fsPagerView: FSPagerView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblManufacture: UILabel!
    @IBOutlet weak var lblTag: UILabel!
    @IBOutlet weak var lblCategoryName: UILabel!
    @IBOutlet weak var lblColors: UILabel!
    @IBOutlet weak var lblOrderCount: UILabel!

    private var orderCount: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        lblOrderCount.text = String(orderCount)
    }

    @IBAction func onClickGoBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func onClickAddAndRemoveBookmark(_ sender: Any) {
    }

    @IBAction func onClickReduceCount(_ sender: Any) {
        if(orderCount > 0) {
            orderCount -= 1
            lblOrderCount.text = String(orderCount)
        }
    }

    @IBAction func onClickAddCount(_ sender: Any) {
        orderCount += 1
        lblOrderCount.text = String(orderCount)
    }

    @IBAction func doOrder(_ sender: Any) {
    }

}
