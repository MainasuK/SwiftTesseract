//
//  Tesseract+PageSegMode.swift
//  
//
//  Created by Cirno MainasuK on 2020-5-22.
//

import Foundation
import Clibtesseract

extension Tesseract {
    public enum PageSegMode: Int {
        case OSD_ONLY
        case AUTO_OSD
        case AUTO_ONLY
        case AUTO
        case SINGLE_COLUMN
        case SINGLE_BLOCK_VERT_TEXT
        case SINGLE_BLOCK
        case SINGLE_LINE
        case SINGLE_WORD
        case CIRCLE_WORD
        case SINGLE_CHAR
        case SPARSE_TEXT
        case SPARSE_TEXT_OSD
        case RAW_LINE
        case COUNT
        
        var raw: TessPageSegMode {
            TessPageSegMode(UInt32(self.rawValue))
        }
    }
}
