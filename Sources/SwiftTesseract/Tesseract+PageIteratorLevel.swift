//
//  File.swift
//  
//
//  Created by Cirno MainasuK on 2020-5-17.
//

import Foundation
import Clibtesseract

extension Tesseract {
    public enum PageIteratorLevel: Int {
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
