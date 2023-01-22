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
            return R.string.localizable.commonErrorCoding()
        case .unknown:
            return R.string.localizable.commonErrorUnknown()
        case .noData:
            return R.string.localizable.commonErrorNoData()
        case .serverError:
            return R.string.localizable.commonErrorServerError()
        }
    }
}
