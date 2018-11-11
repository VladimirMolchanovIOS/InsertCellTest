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
        let item = presenter.sections[indexPath.section].items[indexPath.row]
        
        if item.type == .openHoursSchedule {
            if let numberOfLines = (item.model as? OpenHours)?.openHoursSchedule.count {
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
        let sectionModel = presenter.sections[section]
        if sectionModel.type == .contacts {
            let numberOfItems = sectionModel.items.count
            return openHoursSectionExpanded ? numberOfItems : numberOfItems - 1
        }
        return presenter.sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionModel = presenter.sections[indexPath.section]
        let item = sectionModel.items[indexPath.row]
        
        switch item.type {
        case .todayOpenHours:
            let cell = tableView.dequeueReusableCell(withIdentifier: TodayOpenHoursCell.IDENTIFIER, for: indexPath) as! TodayOpenHoursCell
            cell.setupCell(withModel: item.model as! OpenHours)
            return cell
        case .openHoursSchedule:
            let cell = tableView.dequeueReusableCell(withIdentifier: OpenHoursScheduleCell.IDENTIFIER, for: indexPath) as! OpenHoursScheduleCell
            cell.setupCell(withModel: item.model as! OpenHours)
            return cell
        default:
            let cell = UITableViewCell()
            cell.backgroundColor = UIColor(red: CGFloat.random(in: 0.0...1.0), green: CGFloat.random(in: 0.0...1.0), blue: CGFloat.random(in: 0.0...1.0), alpha: 1.0)
            return cell
        }
        
//        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if presenter.sections[indexPath.section].items[indexPath.row].type == .todayOpenHours {
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



