//
//  Tesseract+Error.swift
//  
//
//  Created by Cirno MainasuK on 2020-5-17.
//

import Foundation

extension Tesseract {
    public enum Error: Swift.Error {
        case `internal`(reason: String)
    }
}
