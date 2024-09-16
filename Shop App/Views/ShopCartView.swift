//
//  ShopCart.swift
//  Shop App
//
//  Created by Fırat Ören on 5.09.2024.
//

import SwiftUI

struct ShopCartView: View {
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("My Cart")
                    .font(.title2)
                    .bold()
                Spacer()

            }.padding()

            ScrollView {
                VStack{
                    ForEach(0 ..< 5) { item in
                        HStack(alignment:.top){
                            Image("Shoes")
                                .resizable()
                                .frame(width: 150,height: 150)
                                .overlay {
                                    ZStack(alignment:.topTrailing){
                                        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10), style: .circular).stroke(Color.black,lineWidth: 1.0).opacity(0.2)
                                    }
                                }

                            VStack(alignment:.leading,spacing: 10){
                                HStack{
                                    Text("Shoes Casual Sport")
                                        .font(.system(size: 15)).bold()
                                    Spacer()
                                    Button(action: {}, label: {
                                        Image(systemName: "trash")
                                            .foregroundStyle(Color.orange)
                                            .font(.system(size: 21))
                                            .bold()
                                            .padding(.trailing)
                                    })
                                }

                                Text("Women's Shoes").opacity(0.5).font(.system(size: 13))
                                Spacer()
                                Text("999 ₺").bold().font(.system(size: 24)).padding(.bottom)
                            }
                            Spacer()
                        }.padding(.leading)
                        Divider()
                    }
                }
            }

            VStack(spacing: 8){
                HStack{
                    Text("Sub Total:").font(.system(size: 16))
                    Spacer()
                    Text("6999 ₺").bold().font(.title3)
                }
                HStack{
                    Text("Delivery Fee:").font(.system(size: 16))
                    Spacer()
                    Text("299 ₺").bold().font(.title3)
                }
                HStack{
                    Text("Discount::").font(.system(size: 16))
                    Spacer()
                    Text("20%").bold().font(.title3)
                }
            }.padding()

            Button(action: {}, label: {
                Text("Check out for 6999 ₺")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .foregroundStyle(Color.white)
                    .bold()
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 12, height: 12)))
                    .padding(.horizontal)
            })

            Spacer()
        }





    }
}

#Preview {
    ShopCartView()
}
