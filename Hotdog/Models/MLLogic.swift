//
//  MLLogic.swift
//  Hotdog
//
//  Created by Oleksiy on 10.09.2020.
//  Copyright © 2020 Oleksiy. All rights reserved.
//

import CoreML
import Vision
import SwiftUI

struct Logic {
    let model: VNCoreMLModel
    
    init() {
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("can't load ML model")
        }
        
        self.model = model
    }
    
    func detect(image: CIImage) -> Bool {
        var answer = false
        
        
        let request = VNCoreMLRequest(model: model) { request, error in
            guard let results = request.results as? [VNClassificationObservation],
                let topResult = results.first
                else {
                    fatalError("unexpected result type from VNCoreMLRequest")
            }
                        
            if topResult.identifier.contains("hotdog") {
                
                answer = true
                
            } else {
                
                answer = false
                
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        }
        catch {
            print(error)
        }
        
        return answer
    }
}
