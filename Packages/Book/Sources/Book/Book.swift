import Foundation

public struct Book: Identifiable {
    /// Title of the book, mandatory field
    public let title: String

    /// Name of the author, mandatory
    public let author: String

    /// Release date, optional, should be filled automatically when book is imported
    public let released: Date?

    /// Genre of the book, optional, should be filled automatically when book is imported
    public let genre: String?

    /// URL of the service from where/if the book was imported
    public let url: URL?

    /// A generated ID for display purposes only.
    ///
    /// The ID is generated from author and title.
    /// When user manually adds a book, typing in the ISBN would be cumbersome.
    public let id: String

    init(
        title: String,
        author: String,
        released: Date? = nil,
        genre: String? = nil,
        url: URL? = nil
    ) {
        self.title = title
        self.author = author
        self.released = released
        self.genre = genre
        self.url = url
        id = "\(author):\(title)"
    }
}

extension Book {
    static let stub = Book(
        title: "The Great Gatsby",
        author: "F. Scott Fitzgerald",
        released: nil,
        genre: "Tragedy",
        url: nil
    )
}
