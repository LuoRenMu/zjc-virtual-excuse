from mitmproxy import http
from urllib.parse import urlparse, urlunparse

HOST = "server.luorenmu.cn:8989"


def redirect_request(flow: http.HTTPFlow, new_path: str = None) -> None:
    original_url = urlparse(flow.request.url)
    scheme = "http"
    netloc = HOST
    path = new_path if new_path is not None else original_url.path
    params = original_url.params
    query = original_url.query
    fragment = original_url.fragment
    new_url = urlunparse((scheme, netloc, path, params, query, fragment))
    flow.request.scheme = scheme
    flow.request.host = netloc
    flow.request.url = new_url

    print(f"Redirected {flow.request.pretty_url}")


def request(flow: http.HTTPFlow) -> None:
    if "wxapp_stuasklelist" in flow.request.pretty_url:
        redirect_request(flow, "")

    if "wxapp_user" in flow.request.pretty_url:
        redirect_request(flow, "/weixin/wxapp_user")
