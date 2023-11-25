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
    
    private let model: VNCoreMLModel
    
    init() {
        
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            
            fatalError("can't load ML model")
        }
        
        self.model = model
    }
    
    func detect(image: CIImage) -> Bool {
        
        var answer = false
        
        let request = VNCoreMLRequest(model: model) { request, _ in
            
            answer = request.results?.compactMap({ $0 as? VNClassificationObservation })
                .map({ $0.identifier })
                .contains("hotdog") ?? false
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        try? handler.perform([request])
        
        return answer
    }
}
