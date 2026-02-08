import SwiftUI

struct DQSubtitle: View {

    let text: String

    var body: some View {
        Text(text)
            .font(.system(size: 13, weight: .regular))
            .foregroundColor(Color("TextSecondary").opacity(0.6))
    }
}

