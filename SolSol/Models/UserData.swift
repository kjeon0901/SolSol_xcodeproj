/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A model object that stores app data.
*/

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var hashTags = hashTagData
    @Published var timelines = timelineData
    @Published var userProfiles = userProfileData
    @Published var product = ProductItem.default
    @Published var chattings = chattingData
}
