/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that shows a featured landmark.
*/

import SwiftUI

struct FeatureCard: View {
    var photoImage: Image
    
    var body: some View {
        photoImage
            .resizable()
            .scaledToFill()
            .overlay(TextOverlay(overlayText: "Las Vagas Strip"))
    }
}

struct TextOverlay: View {
    var overlayText: String
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.7), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            HStack {
                Image(systemName: "location.circle")
                    .imageScale(.medium)
                Text(overlayText)
                    .font(.headline)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(photoImage: timelineData[0].photoImages[0])
    }
}
