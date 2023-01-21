//
//  RMError.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 21/01/2023.
//

import Foundation

/// RMError with some general error types
enum RMError: LocalizedError, Equatable {
    case codingError
    case unknown
    case noData
    case serverError
    
    public var errorDescription: String? {
        switch self {
        case .codingError:
            return "L10n.Common.Error.coding"
        case .unknown:
            return "L10n.Common.Error.unknown"
        case .noData:
            return "L10n.Common.Error.noData"
        case .serverError:
            return "L10n.Common.Error.serverError"
        }
    }
}
