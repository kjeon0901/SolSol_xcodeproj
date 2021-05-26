/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that shows a featured landmark.
*/

import SwiftUI

struct EventCard: View {
    var eventImage: Image
    
    var body: some View {
        eventImage
            .resizable()
            .aspectRatio(2.6, contentMode: .fit)
    }
}

struct EventCard_Previews: PreviewProvider {
    static var previews: some View {
        EventCard(eventImage: ImageStore.shared.image(name: "event1"))
    }
}
