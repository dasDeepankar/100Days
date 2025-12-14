//
//  GeometryReaderResizing.swift
//  LayoutAndGeometry
//
//  Created by Deepankar Das on 14/12/25.
//

import SwiftUI

struct GeometryReaderResizing: View {
    var body: some View {
        HStack{
            Text("Image")
                .font(.title)
                .frame(width: 200)
            GeometryReader { proxy in
                Image(.example)
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width * 0.8)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
    }
}

#Preview {
    GeometryReaderResizing()
}
