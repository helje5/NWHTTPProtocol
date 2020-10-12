#!/usr/bin/swift

import NWHTTPServer

var counter = 0

let server = try HTTPServer(port: 8000) { req, res in
  counter += 1
  
  print("\(req.method) \(req.url)")
  
  req.onEnd {
    if !req.content.isEmpty {
      if let s = req.contentAsString {
        print("String content:\n---\n\(s)\n---")
      }
      else {
        print("Data content:", req.content)
      }
    }
    
    try? res.send("Hello World \(counter)!\n")
  }
}

print("Starting HTTP server on port 8000 ...")
server.run()
