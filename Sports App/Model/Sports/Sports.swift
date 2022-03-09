//
//  Sports.swift
//  Sports App
//
//  Created by Hassan on 23/02/2022.
//

import Foundation
// MARK: - Sports
struct Sports: Codable {
    let sports: [Sport]
}

// MARK: - Sport
struct Sport: Codable {
    let idSport, strSport: String
    let strFormat: StrFormat
    let strSportThumb: String
    let strSportIconGreen: String
    let strSportDescription: String
}

enum StrFormat: String, Codable {
    case eventSport = "EventSport"
    case teamvsTeam = "TeamvsTeam"
}
