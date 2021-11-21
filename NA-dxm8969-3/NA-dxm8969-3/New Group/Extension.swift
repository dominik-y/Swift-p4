
//  ImageExtension.swift
//  NA-dxm8969-3
//
//  Created by Dominik Maric on 21.11.2021..
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

extension Image {
    static func loadFrom<Placeholder: View>(url: URL?, @ViewBuilder placeholder: () -> Placeholder) -> some View {
        return WebImage(url: url)
        .resizable()
        .placeholder {
            placeholder()
        }
        .indicator(.activity)
    }
}


