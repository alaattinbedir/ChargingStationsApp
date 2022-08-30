//
//  StationsResponse.swift
//  ChargingStationsApp
//
//  Created by Alaattin Bedir on 30.08.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let stationsResponse = try? newJSONDecoder().decode(StationsResponse.self, from: jsonData)

import Foundation

// MARK: - StationsResponseElement
struct StationsResponseElement: Codable {
    let metadataValues: [MetadataValue]?
    let isRecentlyVerified: Bool?
    let userComments: JSONNull?
    let usageTypeID: Int?
    let dataProvider: DataProvider?
    let dataProvidersReference: String?
    let dataQualityLevel, operatorID: Int?
    let dateCreated: Date?
    let datePlanned: JSONNull?
    let usageType: UsageType?
    let submissionStatus: SubmissionStatus?
    let addressInfo: AddressInfo?
    let percentageSimilarity: JSONNull?
    let numberOfPoints: Int?
    let submissionStatusTypeID: Int?
    let statusType: StatusType?
    let uuid: String?
    let parentChargePointID: JSONNull?
    let dateLastVerified: Date?
    let id: Int?
    let usageCost, mediaItems: JSONNull?
    let operatorInfo: OperatorInfo?
    let operatorsReference: JSONNull?
    let connections: [Connection]?
    let generalComments, dateLastConfirmed: JSONNull?
    let dataProviderID, statusTypeID: Int?
    let dateLastStatusUpdate: Date?

    enum CodingKeys: String, CodingKey {
        case metadataValues = "MetadataValues"
        case isRecentlyVerified = "IsRecentlyVerified"
        case userComments = "UserComments"
        case usageTypeID = "UsageTypeID"
        case dataProvider = "DataProvider"
        case dataProvidersReference = "DataProvidersReference"
        case dataQualityLevel = "DataQualityLevel"
        case operatorID = "OperatorID"
        case dateCreated = "DateCreated"
        case datePlanned = "DatePlanned"
        case usageType = "UsageType"
        case submissionStatus = "SubmissionStatus"
        case addressInfo = "AddressInfo"
        case percentageSimilarity = "PercentageSimilarity"
        case numberOfPoints = "NumberOfPoints"
        case submissionStatusTypeID = "SubmissionStatusTypeID"
        case statusType = "StatusType"
        case uuid = "UUID"
        case parentChargePointID = "ParentChargePointID"
        case dateLastVerified = "DateLastVerified"
        case id = "ID"
        case usageCost = "UsageCost"
        case mediaItems = "MediaItems"
        case operatorInfo = "OperatorInfo"
        case operatorsReference = "OperatorsReference"
        case connections = "Connections"
        case generalComments = "GeneralComments"
        case dateLastConfirmed = "DateLastConfirmed"
        case dataProviderID = "DataProviderID"
        case statusTypeID = "StatusTypeID"
        case dateLastStatusUpdate = "DateLastStatusUpdate"
    }
}

// MARK: - AddressInfo
struct AddressInfo: Codable {
    let postcode, addressLine1: String?
    let countryID, id: Int?
    let addressLine2, stateOrProvince: String?
    let latitude: Double?
    let contactTelephone2, contactEmail, relatedURL, contactTelephone1: JSONNull?
    let longitude, distance: Double?
    let distanceUnit: Int?
    let title, town: String?
    let accessComments: String?
    let country: Country?

    enum CodingKeys: String, CodingKey {
        case postcode = "Postcode"
        case addressLine1 = "AddressLine1"
        case countryID = "CountryID"
        case id = "ID"
        case addressLine2 = "AddressLine2"
        case stateOrProvince = "StateOrProvince"
        case latitude = "Latitude"
        case contactTelephone2 = "ContactTelephone2"
        case contactEmail = "ContactEmail"
        case relatedURL = "RelatedURL"
        case contactTelephone1 = "ContactTelephone1"
        case longitude = "Longitude"
        case distance = "Distance"
        case distanceUnit = "DistanceUnit"
        case title = "Title"
        case town = "Town"
        case accessComments = "AccessComments"
        case country = "Country"
    }
}

// MARK: - Country
struct Country: Codable {
    let continentCode: String?
    let id: Int?
    let title, isoCode: String?

    enum CodingKeys: String, CodingKey {
        case continentCode = "ContinentCode"
        case id = "ID"
        case title = "Title"
        case isoCode = "ISOCode"
    }
}

// MARK: - Connection
struct Connection: Codable {
    let currentType: CurrentType?
    let levelID: Int?
    let reference: JSONNull?
    let statusTypeID, id: Int?
    let amps, voltage: Int?
    let statusType: StatusType?
    let connectionType: ConnectionType?
    let powerKW, currentTypeID: Int?
    let level: Level?
    let quantity: Int?
    let comments: JSONNull?
    let connectionTypeID: Int?

    enum CodingKeys: String, CodingKey {
        case currentType = "CurrentType"
        case levelID = "LevelID"
        case reference = "Reference"
        case statusTypeID = "StatusTypeID"
        case id = "ID"
        case amps = "Amps"
        case voltage = "Voltage"
        case statusType = "StatusType"
        case connectionType = "ConnectionType"
        case powerKW = "PowerKW"
        case currentTypeID = "CurrentTypeID"
        case level = "Level"
        case quantity = "Quantity"
        case comments = "Comments"
        case connectionTypeID = "ConnectionTypeID"
    }
}

// MARK: - ConnectionType
struct ConnectionType: Codable {
    let isObsolete, isDiscontinued: Bool?
    let id: Int?
    let title, formalName: String?

    enum CodingKeys: String, CodingKey {
        case isObsolete = "IsObsolete"
        case isDiscontinued = "IsDiscontinued"
        case id = "ID"
        case title = "Title"
        case formalName = "FormalName"
    }
}

// MARK: - CurrentType
struct CurrentType: Codable {
    let id: Int?
    let title, currentTypeDescription: String?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case title = "Title"
        case currentTypeDescription = "Description"
    }
}

// MARK: - Level
struct Level: Codable {
    let id: Int?
    let comments: String?
    let isFastChargeCapable: Bool?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case comments = "Comments"
        case isFastChargeCapable = "IsFastChargeCapable"
        case title = "Title"
    }
}

// MARK: - StatusType
struct StatusType: Codable {
    let id: Int?
    let isOperational, isUserSelectable: Bool?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case isOperational = "IsOperational"
        case isUserSelectable = "IsUserSelectable"
        case title = "Title"
    }
}

// MARK: - DataProvider
struct DataProvider: Codable {
    let dataProviderStatusType: DataProviderStatusType?
    let id: Int?
    let license: String?
    let isOpenDataLicensed: Bool?
    let comments: JSONNull?
    let isApprovedImport: Bool?
    let title: String?
    let dateLastImported: String?
    let websiteURL: String?
    let isRestrictedEdit: Bool?

    enum CodingKeys: String, CodingKey {
        case dataProviderStatusType = "DataProviderStatusType"
        case id = "ID"
        case license = "License"
        case isOpenDataLicensed = "IsOpenDataLicensed"
        case comments = "Comments"
        case isApprovedImport = "IsApprovedImport"
        case title = "Title"
        case dateLastImported = "DateLastImported"
        case websiteURL = "WebsiteURL"
        case isRestrictedEdit = "IsRestrictedEdit"
    }
}

// MARK: - DataProviderStatusType
struct DataProviderStatusType: Codable {
    let id: Int?
    let title: String?
    let isProviderEnabled: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case title = "Title"
        case isProviderEnabled = "IsProviderEnabled"
    }
}

// MARK: - MetadataValue
struct MetadataValue: Codable {
    let id: Int?
    let metadataFieldOptionID: JSONNull?
    let itemValue: String?
    let metadataFieldID: Int?
    let metadataFieldOption: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case metadataFieldOptionID = "MetadataFieldOptionID"
        case itemValue = "ItemValue"
        case metadataFieldID = "MetadataFieldID"
        case metadataFieldOption = "MetadataFieldOption"
    }
}

// MARK: - OperatorInfo
struct OperatorInfo: Codable {
    let phoneSecondaryContact, addressInfo: JSONNull?
    let isRestrictedEdit: Bool?
    let id: Int?
    let contactEmail: String?
    let bookingURL: JSONNull?
    let websiteURL: String?
    let faultReportEmail: JSONNull?
    let phonePrimaryContact: String?
    let isPrivateIndividual: Bool?
    let comments: JSONNull?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case phoneSecondaryContact = "PhoneSecondaryContact"
        case addressInfo = "AddressInfo"
        case isRestrictedEdit = "IsRestrictedEdit"
        case id = "ID"
        case contactEmail = "ContactEmail"
        case bookingURL = "BookingURL"
        case websiteURL = "WebsiteURL"
        case faultReportEmail = "FaultReportEmail"
        case phonePrimaryContact = "PhonePrimaryContact"
        case isPrivateIndividual = "IsPrivateIndividual"
        case comments = "Comments"
        case title = "Title"
    }
}

// MARK: - SubmissionStatus
struct SubmissionStatus: Codable {
    let isLive: Bool?
    let id: Int?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case isLive = "IsLive"
        case id = "ID"
        case title = "Title"
    }
}

// MARK: - UsageType
struct UsageType: Codable {
    let id: Int?
    let isAccessKeyRequired, isPayAtLocation: Bool?
    let title: String?
    let isMembershipRequired: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case isAccessKeyRequired = "IsAccessKeyRequired"
        case isPayAtLocation = "IsPayAtLocation"
        case title = "Title"
        case isMembershipRequired = "IsMembershipRequired"
    }
}

typealias StationsResponse = [StationsResponseElement]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
