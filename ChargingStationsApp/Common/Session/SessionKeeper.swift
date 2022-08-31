//
//  Session.swift
//  ChargingStationsApp
//
//  Created by Alaattin Bedir on 30.08.2022.
//

class SessionKeeper {
    static let shared = SessionKeeper()

    var loginUserName: String?
}

enum SessionStatus {
    case undefined
    case logined
    case serviceSessionExpire
    case securityError
    case logOffSession
    case appTerminated
    case appBackgroundTimeout
}
