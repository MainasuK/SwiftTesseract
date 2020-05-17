//
//  Tesseract+ResultIterator.swift
//  
//
//  Created by Cirno MainasuK on 2020-5-17.
//

import Foundation
import Clibtesseract

extension Tesseract {
    public class ResultIterator {
        let raw: OpaquePointer
        
        init(raw: OpaquePointer) {
            self.raw = raw
        }
        
        public func next(level: PageIteratorLevel) -> Bool {
            return TessResultIteratorNext(raw, level.raw) == 1
        }
        
        public func text(level: PageIteratorLevel) -> String? {
            guard let text = TessResultIteratorGetUTF8Text(raw, level.raw) else {
                return nil
            }
            defer {
                TessDeleteText(text)
            }
            
            return String(cString: text)
        }
        
        public func confidence(level: PageIteratorLevel) -> Float {
            return TessResultIteratorConfidence(raw, level.raw)
        }
        
        public func pageIterator() -> PageIterator {
            return PageIterator(raw: TessResultIteratorGetPageIterator(raw))
        }
        
        deinit {
            TessResultIteratorDelete(raw)
        }
    }
}

