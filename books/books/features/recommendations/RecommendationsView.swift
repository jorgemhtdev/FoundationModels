//
// Created by jorge on 18/6/25.
//

import SwiftUI
import FoundationModels

struct RecommendationsView: View {
    @State private var viewModel: RecommendationsViewModel

    init(genres: [String]) {
        _viewModel = State(initialValue: RecommendationsViewModel(genres: genres))
    }

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading recommendations…")
                    .padding()
            } else {
                List(viewModel.suggestions, id: \.id) { book in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(book.title ?? "")
                            .font(.headline)
                        Text(book.description ?? "")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 8)
                }
                .navigationTitle("Recommendations")
            }
        }
        .task {
            await viewModel.fetchRecommendations()
        }
    }
}

#Preview {
    RecommendationsView(genres: [
        "Fiction", "Nonfiction", "Mystery", "Romance",
        "Science Fiction", "Fantasy", "Biography",
        "History", "Poetry", "Adventure"
    ])
}
