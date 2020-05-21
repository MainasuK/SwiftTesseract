//
//  File.swift
//  
//
//  Created by Cirno MainasuK on 2020-5-17.
//

import Foundation

extension Tesseract {
    public enum Language {
        case english
        case custom(String)
        
        var lang: String {
            switch self {
            case .english:
                return "eng"
            case .custom(let lang):
                return lang
            }
        }
    }
}
