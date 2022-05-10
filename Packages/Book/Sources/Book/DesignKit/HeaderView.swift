import SwiftUI

/// HeaderView
/// is used for adding title to sections
struct HeaderView: View {
    let image: Image
    let title: Text

    var body: some View {
        Label {
            title
        } icon: {
            image
        }
        .font(.headline)
    }
}

struct HeaderViewView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(
            image: Image(systemName: "book"),
            title: Text("Books")
        )
    }
}

private struct LibraryViewContent: LibraryContentProvider {
    var views: [LibraryItem] {
        LibraryItem(
            HeaderView(
                image: Image(systemName: "book"),
                title: Text("Books")
            )
        )
    }
}
