//
//  TodayOpenHoursCell.swift
//  InsertCellTest
//
//  Created by Владимир Молчанов on 11/11/2018.
//  Copyright © 2018 Владимир Молчанов. All rights reserved.
//

import UIKit

class TodayOpenHoursCell: UITableViewCell {
    
    static let IDENTIFIER = "TodayOpenHoursCell"
    static let NIB = UINib(nibName: "TodayOpenHoursCell", bundle: nil)
    
    @IBOutlet private weak var whenClosedTodayLbl: UILabel!
    @IBOutlet private weak var selStateIconLbl: UILabel!
    
    private var isOpenHoursExpanded = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
        // Configure the view for the selected state
        
        if selected {
            isOpenHoursExpanded.toggle()
            // Rotate icon
//            let rotation = selStateIconLbl.transform.rotated(by: CGFloat.pi)
            if isOpenHoursExpanded {
                print("isOpenHoursExpanded - true")
                UIView.animate(withDuration: 0.3, animations: {
                    self.selStateIconLbl.transform = CGAffineTransform(rotationAngle: 179.9 * (CGFloat.pi / 180.0))
                    
                })
            } else {
                print("isOpenHoursExpanded - false")
                UIView.animate(withDuration: 0.3, animations: {
                    self.selStateIconLbl.transform = CGAffineTransform.identity
                })
            }
        }
    }
    
    func setupCell(withModel openHours: OpenHours) {
        whenClosedTodayLbl.text = openHours.today
    }
    
}
