//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Gaurang Lathiya on 28/11/19.
//  Copyright © 2019 Gaurang Lathiya. All rights reserved.
//

import SwiftUI
import UIKit

public enum ImageShape: String {
        case circle = ".circle"
        case circleFill = ".circle.fill"
        case square = ".square"
        case squareFill = ".square.fill"
        case like = "hand.thumbsup"
        case likeFill = "hand.thumbsup.fill"
        case dislike = "hand.thumbsdown"
        case dislikeFill = "hand.thumbsdown.fill"
        
        var reactImage: UIImage {
            let boldLargeConfig = UIImage.SymbolConfiguration(pointSize: UIFont.systemFontSize, weight: .bold, scale: .large)
            return UIImage(systemName: self.rawValue, withConfiguration: boldLargeConfig)!
        }
        
        func getImage(withNumber number: Int, isAlphabate: Bool = false) -> UIImage {
            
            var imgName: String = ""
            if isAlphabate {
                imgName = String( Character(UnicodeScalar(Int(UnicodeScalar("a").value) + (number - 1) ) ?? "a"))
            } else {
                imgName = "\(number)"
            }
            imgName += self.rawValue
            
            let symblConfigTxtStyle = UIImage.SymbolConfiguration(textStyle: .title2)
            
//            let boldLargeConfig = UIImage.SymbolConfiguration(pointSize: UIFont.systemFontSize, weight: .bold, scale: .large)
//            let smallConfig = UIImage.SymbolConfiguration(scale: .small)
//            let boldSmallConfig = boldLargeConfig.applying(smallConfig)
            
            let finalImage = UIImage(systemName: imgName, withConfiguration: symblConfigTxtStyle) ?? UIImage(systemName: "questionmark", withConfiguration: symblConfigTxtStyle)!
            return finalImage
        }
        
        func getImageName(withNumber number: Int, isAlphabate: Bool = false) -> String {
            
            var imgName: String = ""
            if isAlphabate {
                imgName = String( Character(UnicodeScalar(Int(UnicodeScalar("a").value) + (number - 1) ) ?? "a"))
            } else {
                imgName = "\(number)"
            }
            imgName += self.rawValue
            return imgName
        }
        
    }

struct ContentView: View {
    
    var arrWebseries: [WebSeries] = arrWebSeriesDummy //[WebSeries]()
    
    var body: some View {
        
        // Adding background color by adding ZStack
        //        ZStack() {
        //            Color.yellow
        //            .edgesIgnoringSafeArea(.all)
        //            // main view
        //           ExtractedView()
        //        }
        
        // Adding background color by overlay
        //        Color.purple
        //            .edgesIgnoringSafeArea(.all)
        //            .overlay(
        //                ExtractedView()
        //            )
        
        // Adding background color by background view
        //        VStack(alignment: .center, spacing:10) {
        //            MainView()
        ////                .background(
        ////                    Color.pink
        ////                )
        ////            MainView()
        ////            .background(Color.orange
        ////            .padding(.horizontal, 10)
        ////            .padding(.top, 10)
        ////            .edgesIgnoringSafeArea(.all))
        ////            .background(
        ////                Color.orange
        ////            )
        //
        ////            Spacer()
        //
        //
        //
        //        }.background(Color.white.edgesIgnoringSafeArea(.all))
        //            .shadow(radius: 10)
        
        HStack {
            NavigationView {
                
                ListView(arrWebseries: arrWebseries)
//                let paperPlane = UIImage(systemName: "paperplane.fill")
//                    return UIImage(named: "JackRyan")!
//                        Image(uiImage: UIImage(systemName: "paperplane.fill")!)
//                    Image(uiImage: paperPlane)
                    
                    //            List(arrWebseries) { webSeries in
                    //                DetailView(webseries: webSeries)
                    //            }
                    
                    // Add Navigation bar title and bar button items
                    .navigationBarTitle("Web Series", displayMode: .inline).foregroundColor(.black)
                
                //            .navigationBarItems(leading:
                //                Button(action: {
                //                    print("Tapped Left")
                //                }, label: {
                //                    Text("Left").font(.body)
                //                })
                //                , trailing:
                //                Button(action: {
                //                    print("Tapped Right")
                //                }, label: {
                //                    Text("Right").font(.body)
                //                })
                //            )
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
           ContentView(arrWebseries: arrWebSeriesDummy)
              .environment(\.colorScheme, .light)

           ContentView(arrWebseries: arrWebSeriesDummy)
              .environment(\.colorScheme, .dark)
        }
    }
}

struct ListView: View {
    
    var arrWebseries: [WebSeries] = [WebSeries]()
    
    init(arrWebseries: [WebSeries]) {
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()
        
        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
        
        // To hide the scroll indicator
        UITableView.appearance().showsVerticalScrollIndicator = false
        
        self.arrWebseries = arrWebseries
    }
    
    var body: some View {
        List(arrWebseries) { webSeries in
            NavigationLink(destination: DetailView(webseries: webSeries)) {
                ListCellView(webseries: webSeries)
            }
        }.navigationBarTitle("Web Series")
    }
    
}

struct ListCellView: View {
    
    var webseries: WebSeries
    
    var body: some View {
    
        HStack(alignment: .center, spacing: 10) {
            
            Image(uiImage: ImageShape.square.getImage(withNumber: webseries.id, isAlphabate: true).withRenderingMode(.alwaysTemplate))
                .foregroundColor(Color.init(UIColor.label))
            
            
            Image(webseries.imgPosterImg)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50.0, height: 50.0, alignment: .center)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.gray, lineWidth: 1)
            )
            VStack(alignment: .leading, spacing: 10) {
                Text(webseries.name).font(.headline)
                    .foregroundColor(Color.init(UIColor.label))
                Text("\(webseries.year) ‧ \(webseries.genere) ‧ \(webseries.numberOfSeason) seasons")
                    .font(.subheadline)
                    .foregroundColor(Color.init(UIColor.label))
                Divider()
            }
            
        }
        
    }
    
}

struct DetailView: View {
    
    var webseries: WebSeries
    
    var body: some View {
        
        List {
            TitleView(webseries: webseries)
            RatingView(webseries: webseries)
            LikeView(webseries: webseries)
            
            DescriptionBioCell(bio: webseries.bio)
            
            DescriptionCell(title: "First episode date:", value: webseries.firstEpisodDate)
            DescriptionCell(title: "Final episode date:", value: webseries.finalEpisodDate)
            
            DescriptionCell(title: "No. of seasons:", value: "\(webseries.numberOfSeason)")
            DescriptionCell(title: "No. of episodes:", value: "\(webseries.numberOfEpisodes) (list of episodes)")
            
            DescriptionCell(title: "Nominations:", value: webseries.nominations)
            DescriptionCell(title: "Network:", value: webseries.network)
        }
            
            //        VStack(alignment: HorizontalAlignment.leading, spacing: 0) {
            //            TitleView(webseries: webseries)
            //            Divider()
            //            RatingView(webseries: webseries)
            //            Divider()
            //            LikeView(webseries: webseries)
            //            Divider()
            //            //            Spacer()
            //        }
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 5.0)
//                            .stroke(lineWidth: 1.0)
//                            .foregroundColor(Color.init(UIColor.opaqueSeparator))
//                    )
            .padding(.horizontal, 10)
            .navigationBarTitle(Text(webseries.name), displayMode: .inline)
    }
}

struct TitleView: View {
    
    var webseries: WebSeries
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            HStack(alignment: .top, spacing: 10) {
                VStack(alignment: .leading, spacing: 20) {
                    Text(webseries.name)
                        .font(.largeTitle)
                        .foregroundColor(Color.init(UIColor.label))
                    Text("\(webseries.year) ‧ \(webseries.genere) ‧ \(webseries.numberOfSeason) seasons")
                        .font(.subheadline)
                        .foregroundColor(Color.init(UIColor.secondaryLabel))
                }
                .padding(.leading, 10)
                Spacer()
                Image(webseries.imgPosterImg)
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
                    .frame(width: 100, height: nil, alignment: .center)
                    .shadow(radius: 10)
            }
            Divider()
        }
        
        //        .background(
        //            Color.init(UIColor.white)
        //        )
    }
}

struct RatingView: View {
    
    var webseries: WebSeries
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            
            HStack(alignment: .top, spacing: 10) {
                Spacer()
                
                VStack(alignment: .center, spacing: 10) {
                    Text(webseries.ratingIMDB)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.init(UIColor.label))
                    Text("IMDb")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.init(UIColor.label))
                }
                
                if webseries.ratingRottenTomatoes.count != 0 {
                    Spacer()
                    Divider().frame(width: nil, height: 60, alignment: .center).allowsTightening(true)
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 10) {
                        Text(webseries.ratingRottenTomatoes)
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.init(UIColor.label))
                        Text("Rotten Tomatoes")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.init(UIColor.label))
                    }
                }
                Spacer()
                Divider().frame(width: nil, height: 60, alignment: .center).allowsTightening(true)
                Spacer()
                VStack(alignment: .center, spacing: 10) {
                    Text(webseries.ratingTVCom)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.init(UIColor.label))
                    Text("TV.com")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.init(UIColor.label))
                }
                Spacer()
            }
            .padding(10)
            Divider()
        }
        //        .overlay(
        //            Rectangle().stroke(lineWidth: 1.0).foregroundColor(Color.init(UIColor.lightGray.withAlphaComponent(0.3)))
        //        )
        //        .background(
        //            Color.white
        //        )
    }
}

struct LikeView: View {
    
    var webseries: WebSeries
    @State private var isLiked = true
    
    var body: some View {
        
        VStack(alignment: HorizontalAlignment.leading, spacing: 0.0) {
            
            HStack(alignment: .center, spacing: 0) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("\(webseries.numberOfLikes)% liked this TV show")
                        .font(.subheadline)
                        .foregroundColor(Color.init(UIColor.label))
                    Text("Google users").font(.subheadline)
                        .foregroundColor(Color.init(UIColor.secondaryLabel))
                }
                .padding( 10)
                Spacer()
                
                // Like & dislike button
                HStack(alignment: .center, spacing: 15) {
                    Button(action: {
                        print("Like Button clicked")
                        self.isLiked.toggle()
                    }) {
                        Image(uiImage: ImageShape.likeFill.reactImage)
                            .foregroundColor(isLiked ? .blue : .gray)
                        
//                        Image("like").renderingMode(.template)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 20, height: nil, alignment: .center)
//                            .foregroundColor(isLiked ? Color.blue : Color.gray)
                    }
                    
                    Button(action: {
                        print("Dislike Button clicked")
//                        self.isLiked.toggle()
                    }) {
                        Image(uiImage: ImageShape.dislikeFill.reactImage)
                        .foregroundColor(isLiked ? .gray : .blue)
                    }
                    .padding(.trailing, 10)
                    .frame(width: 40.0, height: nil, alignment: .center)
                }
            }
            Divider()
        }
        //        .overlay(
        //            Rectangle().stroke(lineWidth: 1.0).foregroundColor(Color.init(UIColor.lightGray.withAlphaComponent(0.3)))
        //        )
        //        .background(
        //            Color.white
        //        )
    }
}

struct DescriptionBioCell: View {
    
    var bio: String
    
    var body: some View {
        Text(bio)
            .font(.subheadline)
            .foregroundColor(Color.init(UIColor.label))
    }
}

struct DescriptionCell: View {
    
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(Color.init(UIColor.label))
            Text(value)
                .font(.subheadline)
                .foregroundColor(Color.init(UIColor.secondaryLabel))
            Spacer()
        }
    }
}

struct DescriptionLinkCell: View {
    
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(Color.init(UIColor.label))
            Text(value)
                .font(.subheadline)
                .foregroundColor(Color.init(UIColor.link))
            Spacer()
        }
    }
}
