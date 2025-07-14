//
//  CategoriesScreen.swift
//  Shopify-IOS
//
//  Created by Macos on 07/06/2025.
//

import SwiftUI

struct CategoriesScreen: View {
    @ObservedObject var viewModel = CategoryViewModel()
    @EnvironmentObject var cartViewModel: CartViewModel
    @Namespace private var animation
    @State private var isModalPresented: Bool = false
    @AppStorage("isGridCat") var isGrid = true
    @State private var searchText: String = ""
    @State private var isPriceFilterPresented: Bool = false
    @Binding var isTabBarHidden: Bool
   
    var body: some View {
        if(viewModel.isLoading){
            ProgressView("Loading products...")
                .foregroundColor(.forText)
        }else{
            VStack {
                Spacer()
                HStack(spacing: 12) {
                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.gray.opacity(0.6))
                        
                        TextField("Search...", text: $searchText)
                            .foregroundColor(.forText)
                            .onChange(of: searchText) { newValue in
                                viewModel.searchProducts(query: newValue)
                            }

                        if !searchText.isEmpty {
                            Button(action: {
                                searchText = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(Color.gray.opacity(0.6))
                            }
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.forBackground)
                    .cornerRadius(10)
                    
                    // Filter Button
                    Button(action: {
                        self.isModalPresented = true
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .font(.title2)
                            .foregroundColor(Constants.AppColor.primaryColor)
                            .padding(10)
                            .background(Color.forBackground)
                            .cornerRadius(10)
                    }
                    Button(action: {
                          self.isPriceFilterPresented = true
                      }) {
                          Image(systemName: "dollarsign.circle")
                              .font(.title2)
                              .foregroundColor(Constants.AppColor.primaryColor)
                              .padding(10)
                              .background(Color.forBackground)
                              .cornerRadius(10)
                      }
                }
                .padding(.horizontal, 15)
                .safeAreaInset(edge: .top) {
                    Color.clear.frame(height: 45)
                }
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)

                VStack(spacing: 15) {
                    HStack {
                        Text("category")
                            .font(.largeTitle.bold())
                            .foregroundColor(Color.forText)
                        
                        Text("Recommended")
                            .fontWeight(.semibold)
                            .padding(.leading, 15)
                            .foregroundColor(Color.gray.opacity(0.6))

                            .offset(y: 2)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    .padding(.horizontal, 15)
                    
                    TagsView()
                }
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 0) {
                        Color.forBackground.ignoresSafeArea()
                        if(viewModel.products.count == 0){
                            VStack {
                                Spacer()
//                                Rectangle()
//                                  .fill(Color.white.opacity(0.2))
//                                  .frame(height: 100)
                                Image("out-of-stock")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                    .padding()
                                    .background(Color.forBackground)
                                Text("No Products Found")
                                    .font(.headline)
                                    .foregroundColor(.forText)
                                Spacer()
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }else{
                            ProductsView(products: viewModel.products, isTabBarHidden: $isTabBarHidden)
                        }
                    }
                }
                )}.ignoresSafeArea(.all, edges: .top)
                .padding(.bottom, 65)
                .background(Color.forBackground)
                .partialSheet(presented: $isModalPresented) {
                    VStack {
                        
                        Text("Filter By")
                            .font(.headline)
                            .padding()
                            .foregroundColor(.forText)
                        
                        VStack(alignment: .leading) {
                            ScrollView{
                                ForEach(viewModel.arrFilter, id: \.self) { value in
                                    Button(action: {
                                        self.isModalPresented = false
                                        viewModel.filterBy = value
                                        viewModel.filterTag()
                                    }) {
                                        Text(value)
                                            .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                                            .padding()
                                            .foregroundColor(viewModel.filterBy == value ? Constants.AppColor.primaryColor : .forText)
                                        
                                        Spacer()
                                    } .padding(.horizontal)
                                        .background(Color.forBackground)

                                }
                              
                            }
                        }.padding(.bottom, 10)
                            .background(Color.forBackground)
                    }  .frame(height: 350)
                        .background(Color.forBackground)
                }.partialSheet(presented: $isPriceFilterPresented) {
                    VStack {
                        Text("Select Price Range")
                            .font(.headline)
                            .padding(.top)

                        Text("From \(Int(viewModel.selectedPriceRange.lowerBound)) to \(Int(viewModel.selectedPriceRange.upperBound))")
                            .font(.caption)
                            .foregroundColor(Color.gray.opacity(0.6))
                            .padding(.bottom, 5)

                        RangeSliderView(range: $viewModel.selectedPriceRange, bounds: viewModel.allProductsPriceRange)
                            .padding(.horizontal)

                        Button("Apply") {
                            isPriceFilterPresented = false
                            viewModel.filterByPrice()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Constants.AppColor.primaryColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                        Rectangle()
                            .fill(Color.forBackground.opacity(0.2))
                          .frame(height: 50)
                    }
                    .frame(height: 350)
                    
                    .background(Color.forBackground)
                }
                .onAppear(){
                    viewModel.onAppearView()
                    
                }
            Rectangle()
                .fill(Color.forBackground.opacity(0.2))
              .frame(height: 50)
        }
    }
    @ViewBuilder
    func TagsView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(viewModel.tags, id: \.self) { tag in
                    Text(tag)
                        .font(.system(size: 20))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background {
                            if viewModel.activeTag == tag {
                                Capsule()
                                    .fill(Constants.AppColor.primaryColor)
                                    .matchedGeometryEffect(id: "ACTIVETAG", in: animation) // Added
                            } else {
                                Capsule()
                                    .fill(Color.forBackground.opacity(0.3))
                            }
                        }
                        .foregroundColor(viewModel.activeTag == tag ? .white : .gray)
                    /// Changing Active Tag when tapped one of the tag
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.7)) {
                                viewModel.activeTag = tag
                                viewModel.filter()
                            }
                        }
                }
            }
        }
        
        .onAppear(){
            isTabBarHidden = false
            viewModel.onAppearView()
        }
        
    }
}



//#Preview {
//    CategoriesScreen()
//}
 
