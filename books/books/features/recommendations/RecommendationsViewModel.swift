//
//  Created by jorge on 18/6/25.
//

import Observation
import FoundationModels

@Observable
class RecommendationsViewModel {
    var genres: [String]
    var suggestions: [Book.PartiallyGenerated] = []
    var isLoading: Bool = false

    init(genres: [String]) {
        self.genres = genres
    }

    func fetchRecommendations() async {
        guard !genres.isEmpty else { return }
        isLoading = true
        defer { isLoading = false }

        do {
            let session = LanguageModelSession {
                "You are a book expert assistant that returns Book structures with title and description."
            }
            let prompt = "Provides a list of 10 recommended books based on these genres: \(genres.joined(separator: ", "))."
            var accumulated: [Book.PartiallyGenerated] = []
            let stream = session.streamResponse(to: prompt, generating: [Book].self)
            for try await partial in stream {
                accumulated = partial
                suggestions = accumulated
            }
        } catch {
            suggestions = []
            print("Error fetching recommendations: \(error)")
        }
    }
}
