import SwiftUI

public extension View {
    func listSeparator(_ visibility: Visibility) -> some View {
        #if os(iOS)
            return listSectionSeparator(visibility)
                .listRowSeparator(visibility)
        #else
            return self
        #endif
    }
}
