//
// Created by jorge on 18/6/25.
//

import Foundation
import FoundationModels

@Generable
struct Book: Equatable, Identifiable {
    let id = UUID()

    @Guide(description: "The title of the book, e.g., 'One Hundred Years of Solitude' or 'Neuromancer'")
    let title: String

    @Guide(description: "A brief description of the book")
    let description: String
}
