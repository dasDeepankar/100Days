//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Deepankar Das on 12/12/25.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName : AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}
struct ContentView: View {
    var body: some View {
        
        //        Text("Live long and prosper")
        //            .frame(width: 300, height: 300, alignment: .topLeading)
        //        HStack(alignment: .lastTextBaseline) {
        //            Text("Live")
        //                .font(.caption)
        //            Text("long")
        //            Text("and")
        //                .font(.title)
        //            Text("prosper")
        //                .font(.largeTitle)
        
        //        VStack(alignment: .leading) {
        //              Text("Hello, world!")
        //              .alignmentGuide(.leading) { d in
        //                   d[.trailing]
        //              }
        //          Text("This is a longer line of text")
        //            ForEach(0..<10){ position in
        //                Text("Postion: \(position)").alignmentGuide(.leading) { _ in
        //                    Double(position) * -10
        //                }
        //            }
        //           }
        //           .background(.red)
        //           .frame(width: 400, height: 400)
        //           .background(.blue)
        
        //        HStack(alignment: .midAccountAndName) {
        //            VStack {
        //                Text("@twostraws")
        //                    .alignmentGuide(.midAccountAndName) { d in
        //                        d[VerticalAlignment.center]
        //                    }
        //                Image(systemName: "star")
        //                    .resizable()
        //                    .frame(width: 64, height: 64)
        //            }
        //
        //            VStack {
        //                Text("Full name:")
        //                Text("PAUL HUDSON")
        //                    .font(.largeTitle)
        //                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
        //                             .font(.largeTitle)
        //            }
        //        }
//        Text("Hello, world!")
//            .background(.red)
//            .position(x: 100, y: 100)

//        Text("Hello, world!")
//             .offset(x: 100, y: 100)
//             .background(.red)
                Text("Hello, world!")
            .background(.red)
                     .offset(x: 100, y: 100)

    }
}

#Preview {
    ContentView()
}
