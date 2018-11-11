//
//  OpenHoursScheduleCell.swift
//  InsertCellTest
//
//  Created by Владимир Молчанов on 11/11/2018.
//  Copyright © 2018 Владимир Молчанов. All rights reserved.
//

import UIKit

class OpenHoursScheduleCell: UITableViewCell {
    
    static let IDENTIFIER = "OpenHoursScheduleCell"
    static let NIB = UINib(nibName: "OpenHoursScheduleCell", bundle: nil)

    @IBOutlet private weak var containerStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(withModel openHours: OpenHours) {
        // Clean stack view
        containerStackView.arrangedSubviews.forEach{
            containerStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        
        openHours.openHoursSchedule.forEach {
            let scheduleStackView = UIStackView()
            scheduleStackView.axis = .horizontal
            scheduleStackView.alignment = .center
            scheduleStackView.spacing = 8.0
            
            let daysLabel = UILabel()
            daysLabel.numberOfLines = 1
            daysLabel.text = $0.days
//            daysLabel.sizeToFit()
            
            let hoursLabel = UILabel()
            hoursLabel.numberOfLines = 1
            hoursLabel.text = $0.hours
//            hoursLabel.sizeToFit()
            
            scheduleStackView.addArrangedSubview(daysLabel)
            scheduleStackView.addArrangedSubview(hoursLabel)
            
            containerStackView.addArrangedSubview(scheduleStackView)
        }
        
    }

}
