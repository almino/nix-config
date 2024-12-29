function FindProxyForURL(url, host) {
    let proxy_ufc = "PROXY proxy.ufc.br:8080"
    if (dnsDomainIs(host, ".thelancet.com")) {
        return proxy_ufc;
    }

    if (dnsDomainIs(host, ".doi.org")) {
        return proxy_ufc;
    }

    if (dnsDomainIs(host, ".elsevier.com")) {
        return proxy_ufc;
    }

    if (dnsDomainIs(host, ".sciencedirect.com")) {
        return proxy_ufc;
    }

    return "DIRECT";
}
