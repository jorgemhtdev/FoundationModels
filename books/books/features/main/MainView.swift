//
// Created by jorge on 18/6/25.
//

import SwiftUI

struct MainView: View {
    @State private var viewModel = MainViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.genres, id: \.self, selection: $viewModel.selectedGenres) { genre in
                Text(genre)
            }
            .environment(\.editMode, .constant(.active))
            .navigationTitle("Book Genres")
            .toolbar {
                NavigationLink(
                    "Recommendations",
                    destination: RecommendationsView(genres: Array(viewModel.selectedGenres))
                )
                .disabled(!viewModel.hasSelection)
            }
        }
    }
}

#Preview {
    MainView()
}
