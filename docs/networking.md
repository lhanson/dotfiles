# Networking

## OpenConnect VPN

### Run OpenConnect as non-root user

[Pre-configure a `tun` device and run `vpnc-script` as root](http://www.infradead.org/openconnect/nonroot.html)


### Graceful logoff from command line

My work VPN server will lock me out for 5 minutes if I don't gracefully log off.
When using `openconnect` from the command line, make sure to disconnect like so:

    killall -SIGINT 

### Establish VPN connection using nm-applet

*Problem*

Using openconnect directly to establish a VPN connection works,
however trying to select the VPN connection via `nm-applet` does not; the UI
says:

    XML response has no "auth" node

And the NetworkManager log (`journalctl -u NetworkManager`) indicates

    <info>  [1527536840.8401] settings-connection[0x560b3b42d440,4cd7a884-6636-433e-b5b6-7f2bc9f7febd]: write: successfully commited (keyfile: update /etc/NetworkManager/system-connections/UW Static (4cd7a884-6636-433e-b5b6-7f2bc9f7febd,"UW Static"))
    <error> [1527536840.8414] vpn-connection[0x560b3b5f2470,4cd7a884-6636-433e-b5b6-7f2bc9f7febd,"UW Static",0]: final secrets request failed to provide sufficient secrets

*Solution*

The command-line invocation of `openconnect` works because it prompts for all
the relevant information. NetworkManager references `/etc/NetworkManager/system-connections/${CONNECTION_NAME}`,
which must contain the correct information.
