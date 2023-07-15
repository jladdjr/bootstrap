# IRC Setup

This document provides instructions for connecting to a ZNC server, which in turn is connected to:

- a local IRC service, hosted on a Raspberry Pi machine
- irc.libera.chat

The process of installing and configuring a ZNC server or IRC server
is outside of the scope of this document.
This document focuses on configuring [Weechat](https://weechat.org/), a terminal-based IRC client.

## Weechat on Debian

1. Install Weechat
2. Configure local IRC Server (TODO)
   Keep in mind that we are connecting to the _ZNC_ server.
   All of the configuration here -- username, password, certificate verification --
   reflect how we connect to ZNC.
   The actual information for connecting to the local IRC server is held in ZNC itself.
   ```
   /server add libera pipsqueak/50202 -ssl -username=jim/pipsqueak -password=<password> -autoconnect
   /server irc.server.libera.ssl_verify off
   /connect libera
   ```
   
   Note how the username follows the format "<znc username>/<znc user's server profile name>".
   
3. Configure libera
   As noted in the previous step, we are connecting to _ZNC_.
   The actual information for connecting to the libera IRC server is held in ZNC itself.
   ```
   /server add libera pipsqueak/50202 -ssl -username=jim/libera -password=<password> -autoconnect
   /server irc.server.libera.ssl_verify off
   /connect libera
   ```

   Note how the username follows the format "<znc username>/<znc user's server profile name>".

## Reference

- https://wiki.znc.in/Weechat
