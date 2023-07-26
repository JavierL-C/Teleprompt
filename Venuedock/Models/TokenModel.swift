//
//  TokenModel.swift
//  Venuedock
//
//  Created by Mac on 13/06/2023.
//

import Foundation
struct TokenModel: Codable {
    let accessToken: String?
    let expiresIn: Int?
    let refreshToken, scope, tokenType: String?

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
        case scope
        case tokenType = "token_type"
    }
}
