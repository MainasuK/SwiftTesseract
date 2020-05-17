//
//  Tesseract.swift
//  
//
//  Created by Cirno MainasuK on 2020-5-17.
//

import Cocoa
import Clibtesseract

public class Tesseract {
    
    public static var version: String {
        String(cString: TessVersion())
    }
    
    let handle: TessBaseAPI
        
    public init() {
        handle = TessBaseAPI()
    }
    
}

extension Tesseract {
    
    public func init3(language: Language) throws {
        try handle.init3(language: language.rawValue)
    }
    
    public func setImage2(nsImage image: NSImage) throws {
        let pix = try Leptonica.Pix(image: image)
        handle.setImage2(pix: pix)
    }
    
    public func recognize() throws {
        try handle.recognize()
    }
    
    public func resultIterator() -> ResultIterator? {
        return handle.resultIterator()
    }
    
    public func text() -> String? {
        guard let text = TessBaseAPIGetUTF8Text(handle.intoRaw()) else {
            return nil
        }
        defer {
            TessDeleteText(text)
        }
        
        return String(cString: text)
    }
    
}

