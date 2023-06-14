//
//  SwiftUIView.swift
//  
//
//  Created by 최원석 on 2022/12/11.
//

import SwiftUI

struct shapes: View {
    var body: some View {
        VStack {
            Circle()
                //.fill(Color.blue)
                .strokeBorder(Color.blue, lineWidth: 20.0)
                .frame(width: 200, height: 100.0)
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.blue)
                .frame(width: 200, height: 100.0)
            Capsule()
                .fill(Color.blue)
                .frame(width: 200, height: 100.0)
            Ellipse()
                .fill(Color.blue)
                .frame(width: 200, height: 100.0)
        }
        .background(Color.green)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        shapes()
    }
}
