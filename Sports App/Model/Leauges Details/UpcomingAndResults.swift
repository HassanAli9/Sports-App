//
//  UpcomingEvents.swift
//  Sports App
//
//  Created by Hassan on 02/03/2022.
//

import Foundation
struct UpcomingAndResults : Codable {
    let events: [Event]?
}

// MARK: - Event
struct Event: Codable {
    let idEvent: String?
    let idSoccerXML: String?
    let idAPIfootball, strEvent, strEventAlternate, strFilename: String?
    let strSport, idLeague, strLeague, strSeason: String?
    let strDescriptionEN: String?
    let strHomeTeam, strAwayTeam: String?
    let intHomeScore: String?
    let intRound: String?
    let intAwayScore, intSpectators: String?
    let strOfficial: String?
    let strTimestamp: String?
    let dateEvent: String?
    let dateEventLocal: String?
    let strTime: String?
    let strTimeLocal, strTVStation: String?
    let idHomeTeam, idAwayTeam: String?
    let strResult: String?
    let strVenue, strCountry: String?
    let strCity: String?
    let strPoster, strSquare: String?
    let strFanart: String?
    let strThumb: String?
    let strBanner: String?
    let strMap, strTweet1, strTweet2, strTweet3: String?
    let strVideo: String?
    let strStatus, strPostponed, strLocked: String?
}
