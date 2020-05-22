//
//  Tesseract+PageSegMode.swift
//  
//
//  Created by Cirno MainasuK on 2020-5-22.
//

import Foundation
import Clibtesseract

extension Tesseract {
    public enum PageSegMode: Int, CaseIterable {
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

extension Tesseract.PageSegMode {
    public var text: String {
        switch self {
        case .OSD_ONLY: return "OSD only"
        case .AUTO_OSD: return "auto OSD"
        case .AUTO_ONLY: return "auto only"
        case .AUTO: return "auto"
        case .SINGLE_COLUMN: return "single column"
        case .SINGLE_BLOCK_VERT_TEXT: return "single block vert text"
        case .SINGLE_BLOCK: return "single block"
        case .SINGLE_LINE: return "single line"
        case .SINGLE_WORD: return "single word"
        case .CIRCLE_WORD: return "circle word"
        case .SINGLE_CHAR: return "single char"
        case .SPARSE_TEXT: return "sparse text"
        case .SPARSE_TEXT_OSD: return "sparse text OSD"
        case .RAW_LINE: return "raw line"
        case .COUNT: return "count"
        }
    }
}
