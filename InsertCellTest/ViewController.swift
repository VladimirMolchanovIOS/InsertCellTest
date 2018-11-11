//
//  ViewController.swift
//  InsertCellTest
//
//  Created by Владимир Молчанов on 11/11/2018.
//  Copyright © 2018 Владимир Молчанов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var presenter: Presenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = Presenter()
        
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(TodayOpenHoursCell.NIB, forCellReuseIdentifier: TodayOpenHoursCell.IDENTIFIER)
        tableView.register(OpenHoursScheduleCell.NIB, forCellReuseIdentifier: OpenHoursScheduleCell.IDENTIFIER)
        
        
    }
    
    private var openHoursSectionExpanded = false
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == IndexPath(row: 3, section: 0) {
            if let numberOfLines = (presenter.sections[0].items[3] as? OpenHours)?.openHoursSchedule.count {
                let testLabel = UILabel()
                testLabel.text = "0,"
                testLabel.sizeToFit()
                let lineHeight = testLabel.frame.height
                
                let spacing: CGFloat = 0.0
                let margin: CGFloat = 8.0
                let cellHeight = lineHeight * CGFloat(numberOfLines) + (spacing * CGFloat(numberOfLines - 1)) + (margin * CGFloat(2.0))
                print("cellHeight: \(cellHeight)")
                
                return max(CGFloat(45.0), cellHeight)
            }
        }
        
        return 45.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.lightGray
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            let numberOfItems = presenter.sections[0].items.count
            return openHoursSectionExpanded ? numberOfItems : numberOfItems - 1
        }
        return presenter.sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionModel = presenter.sections[indexPath.section]
        let item = sectionModel.items[indexPath.row]
        
        switch sectionModel.type {
        case .contacts:
            switch indexPath.row {
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: TodayOpenHoursCell.IDENTIFIER, for: indexPath) as! TodayOpenHoursCell
                cell.setupCell(withModel: item as! OpenHours)
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: OpenHoursScheduleCell.IDENTIFIER, for: indexPath) as! OpenHoursScheduleCell
                cell.setupCell(withModel: item as! OpenHours)
                return cell
            default:
                let cell = UITableViewCell()
                cell.backgroundColor = UIColor(red: CGFloat.random(in: 0.0...1.0), green: CGFloat.random(in: 0.0...1.0), blue: CGFloat.random(in: 0.0...1.0), alpha: 1.0)
                return cell
            }
        case .services:
            let cell = UITableViewCell()
            cell.backgroundColor = UIColor(red: CGFloat.random(in: 0.0...1.0), green: CGFloat.random(in: 0.0...1.0), blue: CGFloat.random(in: 0.0...1.0), alpha: 1.0)
            return cell
        }
        
//        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if presenter.sections[indexPath.section].type == .contacts && indexPath.row == 2 {
            openHoursSectionExpanded.toggle()
            let openHoursScheduleIndexPath = IndexPath(row: indexPath.row + 1, section: indexPath.section)
            if openHoursSectionExpanded {
                tableView.insertRows(at: [openHoursScheduleIndexPath], with: .automatic)
            } else {
                tableView.deleteRows(at: [openHoursScheduleIndexPath], with: .automatic)
            }
        }
    }
    
    
}



