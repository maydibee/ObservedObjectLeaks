//
//  PhotosListView.swift
//  ObservableLeaks
//
//  Created by Michael Skuratau on 30/01/25.
//

import SwiftUI


struct PhotosListView: View {
    
    @ObservedObject var viewModel = PhotosListViewModel()
    
    var body: some View {
        List(viewModel.photos) { photo in
            PhotoCell(photo: photo, loader: ImageLoader())
        }
        .onAppear {
            viewModel.loadPhotos()
            viewModel.performLongRunningTask()
        }
    }
}
