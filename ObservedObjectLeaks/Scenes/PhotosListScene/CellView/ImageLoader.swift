//
//  Photo.swift
//  ObservableLeaks
//
//  Created by Michael Skuratau on 30/01/25.
//

import Foundation


class ImageLoader: TraceableObject, ObservableObject {
    
    private var task: URLSessionDataTask?
    @Published var imageData: Data?
   
    deinit {
        task?.cancel()
    }
    
    func loadImage(url: URL) {
        task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            DispatchQueue.main.async {
                self?.imageData = data
            }
        }
        task?.resume()
    }
}


