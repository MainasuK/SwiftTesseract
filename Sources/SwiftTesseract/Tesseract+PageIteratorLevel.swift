//
//  File.swift
//  
//
//  Created by Cirno MainasuK on 2020-5-17.
//

import Foundation
import Clibtesseract

extension Tesseract {
    public enum PageIteratorLevel: Int, CaseIterable {
        case block
        case para
        case textline
        case word
        case symbol
        
        var raw: TessPageIteratorLevel {
            TessPageIteratorLevel(UInt32(self.rawValue))
        }
    }
}

extension Tesseract.PageIteratorLevel {
    public var text: String {
        switch self {
        case .block:        return "Block"
        case .para:         return "Paragraph"
        case .textline:     return "Textline"
        case .word:         return "Word"
        case .symbol:       return "Symbol"
        }
    }
}
