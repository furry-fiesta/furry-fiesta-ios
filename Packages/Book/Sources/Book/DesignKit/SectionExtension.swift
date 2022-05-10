import SwiftUI

extension Section where Parent == HeaderView, Footer == EmptyView {
    init<Data, ItemContent>(
        header: () -> HeaderView,
        data: Data,
        @ViewBuilder content: @escaping (Data.Element) -> ItemContent
    ) where ItemContent: View,
        Data: RandomAccessCollection,
        Data.Element: Identifiable,
        Content == ForEach<Data, Data.Element.ID, ItemContent>
    {
        self.init {
            ForEach(data, content: content)
        } header: {
            header()
        }
    }
}
