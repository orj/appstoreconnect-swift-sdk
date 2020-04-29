//
//  BuildRelationship.swift
//  AppStoreConnect-Swift-SDK
//
//  Created by Pascal Edmond on 17/11/2018.
//

import Foundation

public enum BuildRelationship: Codable {
    case app(App)
    case build(Build)
    case betaTester(BetaTester)
    case betaAppReviewDetail(BetaAppReviewDetail)
    case buildBetaDetail(BuildBetaDetail)
    case preReleaseVersion(PrereleaseVersion)
    case betaAppReviewSubmission(BetaAppReviewSubmission)
    case betaGroup(BetaGroup)

    enum TypeKeys: String, CodingKey {
        case type
    }
    enum CodingKeys: String, Decodable, CodingKey {
        case apps, builds, betaTesters, betaGroups, betaAppReviewDetails, buildBetaDetails, preReleaseVersions, betaAppReviewSubmissions
    }

    public init(from decoder: Decoder) throws {
        switch try decoder.container(keyedBy: TypeKeys.self).decode(CodingKeys.self, forKey: .type) {
        case .apps:
            self = try .app(App(from: decoder))
        case .builds:
            self = try .build(Build(from: decoder))
        case .betaTesters:
            self = try .betaTester(BetaTester(from: decoder))
        case .betaAppReviewDetails:
            self = try .betaAppReviewDetail(BetaAppReviewDetail(from: decoder))
        case .buildBetaDetails:
            self = try .buildBetaDetail(BuildBetaDetail(from: decoder))
        case .preReleaseVersions:
            self = try .preReleaseVersion(PrereleaseVersion(from: decoder))
        case .betaAppReviewSubmissions:
            self = try .betaAppReviewSubmission(BetaAppReviewSubmission(from: decoder))
        case .betaGroups:
            self = try .betaGroup(BetaGroup(from: decoder))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        switch self {
        case .app(let value):
            try value.encode(to: encoder)
        case .build(let value):
            try value.encode(to: encoder)
        case .betaTester(let value):
            try value.encode(to: encoder)
        case .betaAppReviewDetail(let value):
            try value.encode(to: encoder)
        case .buildBetaDetail(let value):
            try value.encode(to: encoder)
        case .preReleaseVersion(let value):
            try value.encode(to: encoder)
        case .betaAppReviewSubmission(let value):
            try value.encode(to: encoder)
        case .betaGroup(let value):
            try value.encode(to: encoder)
        }
    }
}
