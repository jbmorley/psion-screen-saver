// Copyright (c) 2025 Jason Morley
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import ScreenSaver
import SwiftUI

import Diligence



public struct ConfigurationView: View {

    @Environment(\.openURL) private var openURL

    let dismiss: () -> Void

    public init(dismiss: @escaping () -> Void) {
        self.dismiss = dismiss
    }

    public var body: some View {
        Form {

            // Sicne we're hosted inside a different process, `Bundle.main` doesn't correspond with our bundle. Instead,
            // we look up our bundle by class.
            BuildSection("inseven/psion-screen-saver", bundle: Bundle(for: BundleAnchor.self)) {
                Text("About")
            }
            Section("Links") {
                Link("GitHub", url: URL(string: "https://github.com/inseven/psion-screen-saver")!)
            }
            Section("Developers") {
                Link("Jason Morley", url: URL(string: "https://jbmorley.co.uk")!)
            }
        }
        .formStyle(.grouped)
        .safeAreaInset(edge: .bottom) {
            VStack(spacing: 0) {
                Divider()
                HStack {
                    Spacer()
                    Button("Done") {
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
            .background(Color(nsColor: .textBackgroundColor))
        }
        .frame(width: 460, height: 460)
    }

}
