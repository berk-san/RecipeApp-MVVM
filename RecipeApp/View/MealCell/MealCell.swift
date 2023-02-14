//
//  MealCell.swift
//  RecipeApp
//
//  Created by Berk on 13.02.2023.
//

import UIKit
import SDWebImage

class MealCell: UITableViewCell {
    
    static var identifier: String {
        get {
            return "MealCell"
        }
    }
    
    static func register() -> UINib {
        UINib(nibName: "MealCell", bundle: nil)
    }

    
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureUI()
    }
    
    func configureUI() {
        cellView.addBorder(color: .label, width: 0.5)
        cellView.round()
        mealImageView.round(5)
        cellView.backgroundColor = .lightGray
    }
    
    func setupCell(viewModel: MealCellViewModel) {
        self.nameLabel.text = viewModel.mealName
        self.mealImageView.sd_setImage(with: viewModel.mealImageUrl)
    }
}
