import SwiftUI

struct BookItemView: View {
    let book: Book

    var body: some View {
        DynamicStack(hAlignment: .leading) {
            VStack(alignment: .leading) {
                Text(verbatim: book.title)
                Text(verbatim: book.author)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            noteButton
                .font(.footnote)
        }
        .accessibilityElement(children: .combine)
    }

    private var noteButton: some View {
        Button {
            print("Add pressed")
        } label: {
            Label {
                Text("Add note", comment: "Button title to add note to a book in the list")
            } icon: {
                Image(systemName: "note.text.badge.plus")
                // square.and.pencil
            }
        }
        .fixedSize()
        .buttonStyle(.plain)
        .foregroundStyle(.blue)
//        .hoverEffect()
    }

//    private var quoteButton: some View {
//        Button {
//            print("Save quote")
//        } label: {
//            Label {
//                Text("Save quote", comment: "Button title to save a quote from a book")
//            } icon: {
//                Image(systemName: "text.quote")
//                // quote.bubble
//            }
//        }
//        .fixedSize()
//    }
}

struct BookItemView_Previews: PreviewProvider {
    @ViewBuilder
    private static var book: some View {
        BookItemView(book: .stub)
            .padding()
            .background(.background)
    }

    static var previews: some View {
        Group {
            book
                .previewLayout(.sizeThatFits)
                .previewDisplayName("Default")

            book
                .previewLayout(.sizeThatFits)
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark mode")

            book
                .previewLayout(.sizeThatFits)
                .environment(\.layoutDirection, .rightToLeft)
                .previewDisplayName("Right to left")

            book
                .previewLayout(.sizeThatFits)
                .environment(\.dynamicTypeSize, .accessibility5)
                .previewDisplayName("Accessible size")
        }
    }
}
