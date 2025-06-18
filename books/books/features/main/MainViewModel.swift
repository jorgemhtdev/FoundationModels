//
//  Created by jorge on 18/6/25.
//

import SwiftData


@Observable
class MainViewModel {
    
    var genres: [String] = [
        "Fiction",
        "Nonfiction",
        "Mystery",
        "Romance",
        "Science Fiction",
        "Fantasy",
        "Biography",
        "History",
        "Poetry",
        "Adventure"
    ]

    var selectedGenres: Set<String> = []

    var hasSelection: Bool {
        !selectedGenres.isEmpty
    }
}
