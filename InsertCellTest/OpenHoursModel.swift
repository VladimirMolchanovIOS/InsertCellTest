//
//  OpenHoursModel.swift
//  InsertCellTest
//
//  Created by Владимир Молчанов on 11/11/2018.
//  Copyright © 2018 Владимир Молчанов. All rights reserved.
//

import Foundation

struct OpenHours {
    let isOpenNow: Bool
    let today: String
    let openHoursSchedule: [OpenHoursSchedule]
}

struct OpenHoursSchedule {
    let days: String
    let hours: String
}

var mockOpenHours1 = OpenHours(isOpenNow: true, today: "Закроется в 21:00", openHoursSchedule: [
    OpenHoursSchedule(days: "пн-вс", hours: "09:00 - 21:00")
    ])

var mockOpenHours2 = OpenHours(isOpenNow: true, today: "Закроется в 21:00", openHoursSchedule: [
    OpenHoursSchedule(days: "пн-пт", hours: "09:00 - 21:00"),
    OpenHoursSchedule(days: "сб,вс", hours: "12:00 - 18:00")
    ])

var mockOpenHours3 = OpenHours(isOpenNow: true, today: "Закроется в 21:00", openHoursSchedule: [
    OpenHoursSchedule(days: "пн-чт", hours: "09:00 - 21:00"),
    OpenHoursSchedule(days: "пт", hours: "09:00 - 18:00"),
    OpenHoursSchedule(days: "сб,вс", hours: "выходной")
    ])

