import SwiftUI

final class BookModel: ObservableObject {
    @Published
    var title: String = ""

    @Published
    var author: String = ""

    @Published
    var release: Date?

    @Published
    var genre: String = ""

    @Published
    var url: String = ""

    @Published
    var notes: [String] = []
}

struct AddBookView: View {
    private enum Content: CaseIterable, Identifiable {
        case notes
        case details

        var id: Self { self }

        var title: Text {
            switch self {
            case .details:
                return Text("Details", comment: "Segmented control value to display info of the book")
            case .notes:
                return Text("Notes", comment: "Segmented control value to display note for the book")
            }
        }
    }

    @State
    private var content: Content = .notes

    @State
    private var newNote: String = ""

    @StateObject
    private var book = BookModel()

    var body: some View {
        VStack(alignment: .leading) {
            title
            author
            contentPicker

            if content == .notes {
                notes
            } else {
                release
                genre
                url
            }
        }
        .textFieldStyle(.roundedBorder)
        .pickerStyle(.segmented)
        .padding()
    }

    private var title: some View {
        TextField(
            text: $book.title,
            prompt: Text("Prompt Title of the book")
        ) {
            Text("Title of the book")
        }
    }

    private var author: some View {
        TextField(
            text: $book.author,
            prompt: Text("Prompt Author of the book")
        ) {
            Text("Author of the book")
        }
    }

    private var contentPicker: some View {
        Picker(selection: $content) {
            ForEach(Content.allCases) { $0.title }
        } label: {
            Text("")
        }
    }

    private var notes: some View {
        List {
            TextField(
                text: $newNote,
                prompt: Text("Prompt Add note")
            ) {
                Text("Add note")
            }
            .onSubmit {
                guard !newNote.isEmpty else { return }
                book.notes.append(newNote)
                newNote = ""
            }

            ForEach(book.notes, id: \.self) { note in
                Text(verbatim: note)
            }
        }
        .listStyle(.plain)
    }

    private var releaseDateFormatter: Formatter {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = .year
        return formatter
    }

    private var release: some View {
        TextField(
            value: $book.release,
            formatter: releaseDateFormatter,
            prompt: Text("Prompt Release year of the book")
        ) {
            Text("Release year of the book")
        }
        .keyboardType(.numberPad)
    }

    private var genre: some View {
        TextField(
            text: $book.genre,
            prompt: Text("Prompt Genre of the book")
        ) {
            Text("Genre of the book")
        }
    }

    private var url: some View {
        TextField(
            text: $book.url,
            prompt: Text("Prompt URL for the book")
        ) {
            Text("URL for the book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
