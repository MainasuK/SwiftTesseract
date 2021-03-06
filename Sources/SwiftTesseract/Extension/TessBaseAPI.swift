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
    
    func init3(datapath: URL?, language: String) throws {
        let lang = (language as NSString).cString(using: String.Encoding.utf8.rawValue)
        let result = TessBaseAPIInit3(raw, datapath?.path, lang)
        
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

    func setVariable(name: String, value: String) -> Bool {
        return TessBaseAPISetVariable(raw, name, value) == 1
    }
    
    func setPageSegMode(mode: Tesseract.PageSegMode) {
        TessBaseAPISetPageSegMode(raw, mode.raw)
    }
    
    func setRectangle(left: Int, top: Int, width: Int, height: Int) {
        TessBaseAPISetRectangle(raw, Int32(left), Int32(top), Int32(width), Int32(height))
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


