//
//  TransparentLayoutView.swift
//  SnowSeeker
//
//  Created by Deepankar Das on 26/12/25.
//

import SwiftUI
struct UserView: View {
    var body: some View {
        Group{
            Text("Name : Deepankar")
            Text("Country : India")
            Text("Pets : NA")
        }.font(.title)
    }
}

struct TransparentLayoutView: View {
    @State private var layoutVerically = false
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
//        Button{
//            layoutVerically.toggle()
//        }label: {
//            if horizontalSizeClass == .compact{
//                VStack{
//                    UserView()
//                }
//            }else{
//                HStack{
//                    UserView()
//                }
//            }
//        }
//        if horizontalSizeClass == .compact{
//            VStack{
//                UserView()
//            }
//        }else{
//            HStack{
//                UserView()
//            }
//        }
        ViewThatFits{
            Rectangle()
                .frame(width: 500, height: 200)
            Circle()
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    TransparentLayoutView()
}
