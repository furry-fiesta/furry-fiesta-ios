import SwiftUI

struct LibraryView: View {
    @State
    var showAddBook = false

    let inProgress: [Book]
    let allBooks: [Book]

    var body: some View {
        NavigationView {
            List {
                inProgressBooksSection
                allBooksSection
            }
            .controlSize(.small)
            .buttonStyle(.automatic)
            .listStyle(.sidebar)
            .navigationTitle("Library")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        showAddBook = true
                    } label: {
                        Label {
                            Text("Add book")
                        } icon: {
                            Image(systemName: "plus")
                                .symbolVariant(.circle)
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showAddBook) {
            BookView(book: .stub)
        }
    }

    var inProgressBooksSection: some View {
        Section {
            ForEach(inProgress, content: bookItemView)
        } header: {
            HeaderView(
                image: Image(systemName: "book"),
                title: Text("Now reading", comment: "Header for a list of books that are in progress.")
            )
        }
    }

    var allBooksSection: some View {
        Section(
            header: {
                HeaderView(
                    image: Image(systemName: "book.closed"),
                    title: Text("All books", comment: "Header for all of the books in the user's library.")
                )
            },
            data: allBooks,
            content: bookItemView
        )
    }

    func bookItemView(_ book: Book) -> some View {
        NavigationLink {
            Text(book.title)
        } label: {
            BookItemView(book: book)
                .padding(.vertical, 4)
        }
        .labelStyle(.iconOnly)
        .listSeparator(.hidden)
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView(
            inProgress: inProgress,
            allBooks: allBooks
        )
    }

    static let inProgress: [Book] = [
        Book(
            title: "12 rules for life",
            author: "Jordan B. Peterson"
        ),
        Book(
            title: "The great Gatsby",
            author: "F. Scott Fitzgerald"
        ),
    ]

    static let allBooks: [Book] = [
        Book(
            title: "The daily stoic",
            author: "Ryan Holiday"
        ),
        Book(
            title: "Flow",
            author: "Mihaly Csikszentmihalyi"
        ),
        Book(
            title: "The 7 habits of highly effective people",
            author: "Stephen R. Covey"
        ),
        Book(
            title: "The subtle art of not giving a fuck",
            author: "Mark Mason"
        ),
        Book(
            title: "Drive",
            author: "Daniel H. Pink"
        ),
    ]
}
