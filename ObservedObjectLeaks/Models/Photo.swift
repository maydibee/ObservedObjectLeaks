//
//  Photo.swift
//  ObservableLeaks
//
//  Created by Michael Skuratau on 30/01/25.
//

import Foundation

struct Photo: Identifiable, Decodable {
    let id: String
    let author: String
    let download_url: URL
    
    static var mock: [Photo] = [
        Photo(id: "1", author: "John", download_url: URL(string: "https://picsum.photos/200")!),
        Photo(id: "2", author: "Anna", download_url: URL(string: "https://picsum.photos/201")!),
        Photo(id: "3", author: "Mike", download_url: URL(string: "https://picsum.photos/202")!)
    ]
}
