//
//  HomePageView.swift
//  Shop App
//
//  Created by Fırat Ören on 5.09.2024.
//

import SwiftUI

struct HomePageView: View {
    @StateObject var shopManager = ShopManager()
    
    @State var search = ""
    var sellers = ["All","Nike","Adidas","Puma","New Balance"]

    

    var body: some View {
        NavigationStack {
            VStack{
                HStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "menubar.rectangle")
                            .font(.system(size: 25))
                            .foregroundStyle(Color.black)
                    })
                    Spacer()
                    Text("Shop App")
                        .font(.system(size: 20))
                        .bold()
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "bell")
                            .font(.system(size: 25))
                            .foregroundStyle(Color.black)
                    })

                }.padding()

                TextField("What are you looking for ?", text: $search)
                    .padding(8)
                    .background(Color.gray.opacity(0.2))
                    .foregroundStyle(Color.black)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                    .padding(.horizontal)

                if !search.isEmpty {
                    Text("search is active")
                } else {
                    Image("Sale")
                        .resizable()
                        .frame(width: 350,height: 150)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))

                    HStack{
                        Text("New Arrival")
                            .bold()
                        Spacer()
                        Text("See all >")
                            .foregroundStyle(Color.orange)
                            .bold()
                    }.padding()


                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(shopManager.products) { product in
                                NavigationLink(value: product) {
                                    VStack(alignment:.leading){

                                        AsyncImage(url: URL(string: product.image)) { img in
                                            img.resizable().frame(width: 120,height: 120)
                                                .overlay {
                                                    ZStack(alignment:.topTrailing){
                                                        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10), style: .circular).stroke(Color.black,lineWidth: 1.0).opacity(0.2)
                                                    }
                                                }
                                        } placeholder: {
                                            ProgressView()
                                                .frame(width: 120,height: 120)
                                        }

                                        Text(product.title)
                                            .font(.headline)
                                            .foregroundStyle(Color.black)
                                            .lineLimit(1)
                                            .truncationMode(.tail)
                                            .opacity(0.5)
                                            .bold()
                                        Text(String(format:"$%.2f",product.price))
                                            .font(.system(size: 19))
                                            .foregroundStyle(Color.black)
                                            .bold()
                                    }.frame(width: 130)
                                }

                            }
                        }.padding()
                            .navigationDestination(for: Product.self){ product in
                                ProductDetailView(product: product)
                            }
                    }.scrollIndicators(.hidden)

                    HStack{
                        Button(action: {}, label: {
                            Text("Best Seller")
                                .foregroundStyle(Color.black)
                                .bold()
                        })
                        Spacer()
                        Button(action: {}, label: {
                            Text("See all >")
                                .foregroundStyle(Color.orange)
                                .bold()
                        })
                    }.padding()

                    ScrollView(.horizontal) {
                        HStack{
                            ForEach(sellers,id: \.self) { item in
                                Button(action: {

                                }, label: {
                                    ZStack{
                                        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10),style: .circular)
                                            .stroke(Color.orange,lineWidth: 1.0).opacity(0.5).frame(height: 35)

                                        Text(item)
                                            .padding()
                                            .foregroundStyle(Color.black)
                                            .font(.system(size: 16,weight: .light))
                                         //   .background(Color.orange)
                                            .cornerRadius(10)
                                    }

                                })
                            }
                        }.padding(.horizontal)
                    }.scrollIndicators(.hidden)
                }



                


                Spacer()

            }
            //.searchable(text: $search)
            .task {
                 await shopManager.fetchProducts()
            }
            .onAppear{

        }
        }
    }
}

#Preview {
    HomePageView()
}
