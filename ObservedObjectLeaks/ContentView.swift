//
//  ContentView.swift
//  ObservableLeaks
//
//  Created by Michael Skuratau on 30/01/25.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationStack {
            HomeView()
            NavigationLink("Go to photos list") {
                PhotosListView()
            }
        }
    }
}
