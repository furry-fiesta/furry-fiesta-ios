import SwiftUI

struct TextStyles: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Large title")
                    .font(.largeTitle)

                Text("Title")
                    .font(.title)

                Text("Title 2")
                    .font(.title2)

                Text("Title 3")
                    .font(.title3)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Headline")
                    .font(.headline)

                Text("Subheadline")
                    .font(.subheadline)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Body")
                    .font(.body)

                Text("Callout")
                    .font(.callout)

                Text("Caption")
                    .font(.caption)

                Text("Caption 2")
                    .font(.caption2)

                Text("Footnote")
                    .font(.footnote)
            }
        }
    }
}

struct TextStyles_Previews: PreviewProvider {
    static var previews: some View {
        TextStyles()
    }
}
