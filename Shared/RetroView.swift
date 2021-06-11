//
//  RetroView.swift
//  System7
//
//  Created by Cameron Perry on 6/9/21.
//

import SwiftUI

//
//  RetroWindow.swift
//  SwiftUI-Fiddle
//
//  Created by Cameron Perry on 6/9/21.
//

import SwiftUI
struct WindowColors {
    let border = Color(red: 0.12, green: 0.12, blue: 0.14)
    let lightPurple = Color(red: 0.71, green: 0.72, blue: 0.85)
    let medPurple = Color(red: 0.28, green: 0.27, blue: 0.47)
    let darkPurple = Color(red: 0.25, green: 0.24, blue: 0.39)

    let lightGray = Color(red: 0.92, green: 0.92, blue: 0.92)
    let lightGray2 = Color(red: 0.86, green: 0.86, blue: 0.8)
    let medGray1 = Color(red: 0.60, green: 0.60, blue: 0.60)
    let medGray2 = Color(red: 0.77, green: 0.77, blue: 0.77)
    let darkGray = Color(red: 0.58, green: 0.58, blue: 0.58)

}
let colors = WindowColors()
let fontName = "SFPro Bold"

struct RetroScreen: View {
    var body: some View {

        ZStack {
            BackgroundTile(imageName: "single-tile")
            MenuBar()
            IconLayout()
            RetroWindow(title: "About System 7")
        }

    }
}

struct MenuBar: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Text("").font(.system(size: 16, weight: .bold))
                    Text("File")
                    Text("Edit")
                    Text("View")
                    Text("Label")
                    Text("Special")
                    Spacer()
                    if #available(macOS 0, *) {
                        Text("3:59 PM")
                    }
                    Image("menu-bar-right")
                        .resizable()
                        .frame(width: 34, height:13)
                }
                .padding(EdgeInsets(top: geometry.safeAreaInsets.top, leading: 12, bottom: 0, trailing: 12))
                .background(Color.white)
                .font(.system(size: 12, weight: .bold))

                Spacer()
            }.ignoresSafeArea()
        }
    }
}
struct BackgroundTile: View {
    let imageName: String
    var body: some View {
        GeometryReader { geometry in
            Image(imageName).resizable( resizingMode: .tile)
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }.ignoresSafeArea()
    }
}

struct IconLayout: View {
    var body: some View {
        VStack(alignment: .trailing) {

            HStack(alignment: .center){
                Spacer()
                Image("about-selected")
                    .resizable()
                    .frame(width: 77, height: 41.5)
            }
            Spacer()
        }.padding(EdgeInsets(top: 32, leading: 8, bottom: 8, trailing: 8))
    }
}

struct RetroWindow: View {
    var title: String = ""
    var body: some View {
        //TODO: Maybe overlay would work better for some of this?
        ZStack(alignment:.topLeading) {
            Toolbar(title: title).zIndex(100)
            Rectangle()
                .fill(Color.clear)
                .border(colors.border.opacity(0.5),width:1)
                .frame(height:200)
                .offset(x: 1, y: 1)
            Rectangle()
                .fill(Color.white)
                .border(colors.border,width:1)
                .frame(height:200)

            Group {
                HStack(spacing:0) {
                    Spacer()
                    Text("Moof!")
                        .font(.system(size: 14, weight: .bold))
                        .offset(x: 0, y: -20)
                    Image("clarus").resizable().frame(width: 50, height: 50, alignment: .center)

                    Spacer()
                }
            }
            .offset(y:20)
            .frame(height: 180)
        }.frame(width:300)
    }
}

struct Toolbar: View {
    let title: String
    var body: some View {
        //TODO: Maybe overlay would work better for some of this?
        ZStack {
            Group {
                Rectangle().fill(colors.lightGray)
                    .border(colors.border, width: 1)
                    .frame(height: 21, alignment: .center)
            }
            VStack(spacing:0) {
                ForEach([
                    colors.lightPurple,
                    colors.lightGray2,
                    colors.lightGray,
                    colors.darkGray,
                    colors.medGray2, colors.darkGray,
                    colors.medGray2, colors.darkGray,
                    colors.medGray2, colors.darkGray,
                    colors.medGray2, colors.darkGray,
                    colors.medGray2, colors.darkGray,
                    colors.medGray2, colors.darkGray,
                    colors.lightGray,
                    colors.lightGray2,
                    colors.lightPurple,

                ], id: \.self){ line in
                    Rectangle().fill(line).frame(height: 1, alignment: .center)
                }
            }.padding(.horizontal, 1.0)
            ZStack {
                HStack {
                    CloseButton()
                    Spacer()
                }
                Text("\(title)")
                    .font(.system(size: 12, weight: .bold))
                    .frame(height: 14.0, alignment: .center)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 8.0)
                    .background(colors.lightGray)
            }
        }
    }
}

struct CloseButton: View {
    var body: some View {
        ZStack(alignment: .topLeading){
            Rectangle()
                .fill(Color.clear)
                .frame(width: 14, height:14)
                .border(colors.lightGray, width: 1)
                .offset(x:0,y: 0)
            Rectangle()
                .fill(colors.medGray2)
                .frame(width: 12, height:12)
                .border(colors.medPurple, width: 1)
                .offset(x:1, y: 1)
            Rectangle()
                .fill(Color.clear)
                .frame(width: 12, height:12)
                .border(colors.lightPurple, width: 1)
                .offset(x:2,y: 2)

        }.zIndex(101)
            .frame(width:14, height: 14)
            .offset(x:10)
    }

}
struct RetroWindow_Previews: PreviewProvider {
    static var previews: some View {
        RetroScreen()
    }
}
