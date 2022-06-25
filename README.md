#  NWHTTPProtocol

![Swift5](https://img.shields.io/badge/swift-5-blue.svg?style=flat)
![macOS](https://img.shields.io/badge/os-macOS-green.svg?style=flat)
![iOS](https://img.shields.io/badge/os-iOS-green.svg?style=flat)

An HTTP protocol parser (aka 
[NWProtocolFramer](https://developer.apple.com/documentation/network/nwprotocolframer))
for the Apple 
[Network](https://developer.apple.com/documentation/network).framework.

How it works is described in my blog entry:
[Intro to Network.framework Servers](https://www.alwaysrightinstitute.com/network-framework/).

Network.framework requires iOS 13+ / macOS 10.15+.

This is intentionally kept very simple and basic. E.g. it does not define
Swift types for HTTP requests and the like, but puts the status/request/URI in plain
Message metadata fields.

The protocol is just wrapping the (embedded) 
[`http_parser.c/h`](https://github.com/nodejs/http-parser/)
developed as part of the Node.js project.


##  NWHTTPServer

It also includes `NWHTTPServer`, a very simple HTTP server based on
the `NWHTTPProtocol`.

Example:
```swift
let server = HTTPServer { request, response in
    print("Received:", request)
    try response.send("Hello!\n")
}
server.run()
```


## Production

Note that for production use I'd suggest to not use a protocol framer for HTTP.
Instead hookup `http_parser.c` to plain Network.framework (as shown for echo
in the blog article).
At least that's what I do in production apps.
NW protocol framing isn't really required for http_parser.c, 
because that already does all the framing necessary and can be fed
asynchronously).


### Who

**NWHTTPProtocol** is brought to you by
[ZeeZide](http://zeezide.de).
We like 
[feedback](https://twitter.com/ar_institute), 
GitHub stars, 
cool [contract work](http://zeezide.com/en/services/services.html),
presumably any form of praise you can think of.
