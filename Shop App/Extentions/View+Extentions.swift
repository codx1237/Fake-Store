//
//  View+Extentions.swift
//  Shop App
//
//  Created by Fırat Ören on 15.09.2024.
//

import SwiftUI

extension View {
     func gotoLeding() -> some View {
         HStack{
             self
             Spacer()
         }.padding(.horizontal)
    }

    func centerHorizontally() -> some View {
        HStack{
            Spacer()
            self
            Spacer()
        }
    }
    
    func gotoTrailing() -> some View {
        HStack{
            Spacer()
            self
        }
    }


}
