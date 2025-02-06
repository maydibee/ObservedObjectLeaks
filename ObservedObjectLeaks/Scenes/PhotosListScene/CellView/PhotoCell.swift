//
//  PhotoCell.swift
//  ObservableLeaks
//
//  Created by Michael Skuratau on 30/01/25.
//

import SwiftUI


struct PhotoCell: View {
    
    let photo: Photo
    @StateObject var loader: ImageLoader
    
    var body: some View {
        HStack {
            Text(photo.author)
            Spacer()
            Group {
                if let data = loader.imageData, let image = UIImage(data: data) {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                } else {
                    ProgressView()
                }
            }
            .onAppear {
                loader.loadImage(url: photo.download_url)
            }
            .onDisappear {
                loader.imageData = nil
            }
        }
    }
}
