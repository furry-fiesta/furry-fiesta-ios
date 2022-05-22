@testable import Book
import XCTest

final class BookTests: XCTestCase {
    private var bookUrl: URL {
        get throws {
            guard let url = URL(string: "https://books.apple.com/Fus/Fbook/F12-rules-for-life") else {
                throw URLError(.badURL)
            }
            return url
        }
    }

    func test_init() throws {
        let title = "12 rules for life"
        let author = "Jordan B. Peterson"
        let released = Date.now
        let genre = "Nonfiction"
        let url = try bookUrl

        let book = Book(
            title: title,
            author: author,
            released: released,
            genre: genre,
            url: url
        )

        XCTAssertEqual(book.title, title)
        XCTAssertEqual(book.author, author)
        XCTAssertEqual(book.released, released)
        XCTAssertEqual(book.genre, genre)
        XCTAssertEqual(book.url, url)
        XCTAssertEqual(book.id, "\(author):\(title)")
    }
}
