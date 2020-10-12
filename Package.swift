// swift-tools-version:5.1

import PackageDescription

let package = Package(
  
  name: "NWHTTPProtocol",

  platforms : [ .macOS(.v10_15), .iOS(.v13) ],

  products: [
    .library(name: "CHTTPParser"    , targets: [ "CHTTPParser"    ]),
    .library(name: "NWHTTPProtocol" , targets: [ "NWHTTPProtocol" ]),
    .library(name: "NWHTTPServer"   , targets: [ "NWHTTPServer"   ])
  ],
  
  dependencies: [],
  
  targets: [
    .target(name: "CHTTPParser"    , dependencies: []),
    .target(name: "NWHTTPProtocol" , dependencies: [ "CHTTPParser"    ]),
    .target(name: "NWHTTPServer"   , dependencies: [ "NWHTTPProtocol" ]),
    .target(name: "samplehttpd"    , dependencies: [ "NWHTTPServer"   ])
  ]
)
