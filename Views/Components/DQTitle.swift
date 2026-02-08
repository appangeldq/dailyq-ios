import SwiftUI

struct DQTitle: View {

    let text: String

    var body: some View {
        Text(text)
            .font(.system(size: 15, weight: .semibold))
            .foregroundColor(Color("TextPrimary"))
    }
}
