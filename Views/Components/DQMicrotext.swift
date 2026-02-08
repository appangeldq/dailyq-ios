import SwiftUI

struct DQMicroText: View {

    let text: String

    var body: some View {
        Text(text)
            .font(.system(size: 12, weight: .regular))
            .foregroundColor(Color("TextSecondary").opacity(0.4))
    }
}

