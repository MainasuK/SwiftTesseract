//
//  TessBaseAPI.swift
//  
//
//  Created by Cirno MainasuK on 2020-5-17.
//

import Foundation
import Clibtesseract

class TessBaseAPI {
    private let raw: OpaquePointer
    
    init() {
        self.raw = TessBaseAPICreate()
    }
    
    func intoRaw() -> OpaquePointer {
        return raw
    }
    
    deinit {
        TessBaseAPIEnd(raw)
        TessBaseAPIDelete(raw)
    }
    
}

extension TessBaseAPI {
    
    func init3(language: String) throws {
        let lang = (language as NSString).cString(using: String.Encoding.utf8.rawValue)
        let result = TessBaseAPIInit3(raw, nil, lang)
        
        guard result == 0 else {
            throw Tesseract.Error.internal(reason: "cannot init tesseract")
        }
    }
    
    func setImage2(pix: Leptonica.Pix) {
        TessBaseAPISetImage2(raw, pix.raw)
    }
    
    func recognize() throws {
        let result = TessBaseAPIRecognize(raw, nil)
        
        guard result == 0 else {
            throw Tesseract.Error.internal(reason: "tesseract recognize failed")
        }
    }
    
}

extension TessBaseAPI {
    
    func resultIterator() -> Tesseract.ResultIterator? {
        guard let iterator = TessBaseAPIGetIterator(raw) else {
            return nil
        }
        
        return Tesseract.ResultIterator(raw: iterator)
    }
    
}


