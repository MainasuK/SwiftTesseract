//
//  Leptonica+Pix.swift
//  
//
//  Created by Cirno MainasuK on 2020-5-17.
//

import Cocoa
import Clibleptonica

public enum Leptonica {
    public class Pix {
        public var raw: UnsafeMutablePointer<PIX>!
        
        public init(image: NSImage) throws {
            guard let tiffData = image.tiffRepresentation else {
                throw Tesseract.Error.internal(reason: "cannot convert image to tiff representation")
            }
            
            let _pix = tiffData.withUnsafeBytes { bytes -> UnsafeMutablePointer<PIX>? in
                let pointer = bytes.baseAddress!.assumingMemoryBound(to: UInt8.self)
                return pixReadMem(pointer, tiffData.count)
            }

            guard let pix = _pix else {
                throw Tesseract.Error.internal(reason: "cannot read iamge tiff representation to PIX")
            }
            
            self.raw = pix
        }
        
        deinit {
            // most case could be safe to free that PIX due to Tesseract will clone the use the data
            pixDestroy(&raw)
        }
    }
    
}
