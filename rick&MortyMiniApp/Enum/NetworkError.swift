//
//  NetworlErrorEnum.swift
//  rick&MortyMiniApp
//
//  Created by Mikhayl Romanovsky on 2023/8/18.
//

import Foundation

enum NetworkError: Error {
    case urlCreatingError, requestFaild, noData, jsonDecodingError, imageCreatingError
}
