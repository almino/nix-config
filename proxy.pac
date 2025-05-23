function FindProxyForURL(url, host) {
  let proxy_ufc = "PROXY proxy.ufc.br:8080";

  if (dnsDomainIs(host, ".cambridge.org")) {
    return proxy_ufc;
  }
  if (dnsDomainIs(host, ".doi.org")) {
    return proxy_ufc;
  }
  if (dnsDomainIs(host, ".dotlib.com.br")) {
    return proxy_ufc;
  }
  if (dnsDomainIs(host, ".elsevier.com")) {
    return proxy_ufc;
  }
  if (dnsDomainIs(host, ".nature.com")) {
    return proxy_ufc;
  }
  if (dnsDomainIs(host, ".nejm.org")) {
    return proxy_ufc;
  }
  if (
    dnsDomainIs(host, ".periodicos.capes.gov.br")
  ) {
    return proxy_ufc;
  }
  if (dnsDomainIs(host, ".scielo.br")) {
    return proxy_ufc;
  }
  if (dnsDomainIs(host, ".sciencedirect.com")) {
    return proxy_ufc;
  }
  if (dnsDomainIs(host, ".thelancet.com")) {
    return proxy_ufc;
  }

  return "DIRECT";
}
