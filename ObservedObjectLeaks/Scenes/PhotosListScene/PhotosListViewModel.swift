//
//  PhotosListViewModel.swift
//  ObservableLeaks
//
//  Created by Michael Skuratau on 30/01/25.
//

import Foundation
import Combine
import SwiftUI

class PhotosListViewModel: TraceableObject, ObservableObject {

    @Published var photos: [Photo] = []
    
    private var cancellables = Set<AnyCancellable>()
    private var timer: Timer?
    
    deinit {
        photos.removeAll()
        timer?.invalidate()
    }
    
    func loadPhotos() {
        Just(Photo.mock)
            .delay(for: 1, scheduler: RunLoop.main)
            .sink { [weak self] photos in
                self?.photos = photos
            }
            .store(in: &cancellables)
    }
    
    func performLongRunningTask() {
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            print("👻 [PhotosListViewModel] BackgroundTask: I'm haunting your app's memory even after you left!")
        }
    }
}
