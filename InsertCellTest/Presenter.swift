//
//  Presenter.swift
//  InsertCellTest
//
//  Created by Владимир Молчанов on 11/11/2018.
//  Copyright © 2018 Владимир Молчанов. All rights reserved.
//

import Foundation

struct CompanyTableSection {
    enum SectionType {
        case contacts
        case services
    }
    
    let type: SectionType
    var items: [CompanyTableItem] = []
}

struct CompanyTableItem {
    enum ItemType {
        case address
        case phone
        case todayOpenHours
        case openHoursSchedule
        case service
        
        // var cellIdentifier: String
    }
    
    let type: ItemType
    var model: Any
}

class Presenter {
    
    let company = Company.init(address: "Nevsky prospekt 1",
                               phone: "+79219234736",
                               openHours: mockOpenHours1,
                               services: ["Завивка", "Навивка"])
    
    var sections = [CompanyTableSection]()
    
    init() {
        setupContactsSection()
        setupServicesSection()
    }
    
    func setupContactsSection() {
        let addressItem = CompanyTableItem(type: .address, model: company.address)
        let phoneItem = CompanyTableItem(type: .phone, model: company.phone)
        let todayOpenHoursItem = CompanyTableItem(type: .todayOpenHours, model: company.openHours)
        let openHoursScheduleItem = CompanyTableItem(type: .openHoursSchedule, model: company.openHours)
        
        sections.append(CompanyTableSection(type: .contacts, items: [addressItem, phoneItem, todayOpenHoursItem, openHoursScheduleItem]))
    }
    
    func setupServicesSection() {
        let servicesItems = company.services.map { CompanyTableItem(type: .service, model: $0)}
        sections.append(CompanyTableSection(type: .services, items: servicesItems))
    }
}
