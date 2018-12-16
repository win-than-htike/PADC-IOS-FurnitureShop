//
//  ProductDetailViewController.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Elissa Software on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import Auk

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var svProductImages: UIScrollView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDiscount: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblManufacture: UILabel!
    @IBOutlet weak var lblTag: UILabel!
    @IBOutlet weak var lblCategoryName: UILabel!
    @IBOutlet weak var lblColors: UILabel!
    @IBOutlet weak var lblOrderCount: UILabel!
    
    var product: ProductVO? = nil

    private var orderCount: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Detail"
        
        bindData()

        self.showProductImages()

        lblOrderCount.text = String(orderCount)

        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "200$")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))

        lblDiscount.attributedText = attributeString

    }
    
    func bindData() {
        self.lblName.text = product?.name
        self.lblSize.text = product?.size
        self.lblDescription.text = product?.description
        
    }

    private func showProductImages() {
        // Show remote images
        svProductImages.auk.show(url: "https://cb2.scene7.com/is/image/CB2/062818_interiors_home?wid=1680&qlt=60")
        svProductImages.auk.show(url: "https://www.bebitalia.com/sites/default/files/styles/original/public/05_B%26B_Oskar.jpg?itok=RmMx5aPE")
        svProductImages.auk.startAutoScroll(delaySeconds: 3)
        svProductImages.auk.settings.contentMode = .scaleAspectFill
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

        if(orderCount > 0) {
            let dialogMessage = UIAlertController(title: "Confirm",
                                                  message: "Are you sure you want to oreder?",
                                                  preferredStyle: .alert)

            // Create OK button with action handler
            let ok = UIAlertAction(title: "Confirm", style: .default, handler: { (action) -> Void in
                print("Ok button tapped")
                self.doActualOrder()
            })

            // Create Cancel button with action handlder
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
                print("Cancel button tapped")
            })

            //Add OK and Cancel button to dialog message
            dialogMessage.addAction(ok)
            dialogMessage.addAction(cancel)

            // Present dialog message to user
            self.present(dialogMessage, animated: true, completion: nil)
        } else {
            self.showAlertDialog(message: "Please order at least one item.")
        }
    }

    private func doActualOrder() {

    }

}
