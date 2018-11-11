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
    var items: [Any] = []
}

class Presenter {
    
    let company = Company.init(address: "Nevsky prospekt 1",
                               phone: "+79219234736",
                               openHours: mockOpenHours3,
                               services: ["Завивка", "Навивка"])
    
    var sections = [CompanyTableSection]()
    
    init() {
        setupContactsSection()
        setupServicesSection()
    }
    
    func setupContactsSection() {
        let addressItem = company.address
        let phoneItem = company.phone
        let openHoursItem = company.openHours
        
        sections.append(CompanyTableSection(type: .contacts, items: [addressItem, phoneItem, openHoursItem, openHoursItem]))
    }
    
    func setupServicesSection() {
        let servicesItems = company.services
        sections.append(CompanyTableSection(type: .services, items: servicesItems))
    }
}
