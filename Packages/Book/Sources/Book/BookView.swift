import SwiftUI

struct BookView: View {
    let book: Book

    var body: some View {
        Text(verbatim: book.title)
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(book: .stub)
    }
}
