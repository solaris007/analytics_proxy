# Analytics Reverse Proxy

Features a standard `nginx` docker image, configured with self-signed SSL and configurations for:
- Google Analytics
- Google Tag Manager

## Prerequisites
- docker
- docker-compose
- a network that doesn't block DNS resolution of trackers, like GA/GTM

## Usage
- Build: `npm run compose:build`
- Start: `npm run compose:up`
- Stop: `npm run compose:down`

Access the proxy via ports 8080 (HTTP) or 4443 (HTTPS) and host name `analytics-proxy.test`. 
You may need to add a hosts file entry `127.0.0.1    analytics-proxy.test`.

Configured locations:
- `/gtag/js` for Google Tag Manager
- `/analytics.js` for Google Analytics
  - `/r/c*`, `/g/c*`, `/j/c*` and `/c*` to forward to Google Analytics `/collect` endpoint

## Example URLs
- `https://analytics-proxy.test:4443/gtag/js?id=G-SOMEID`
- `http://analytics-proxy.test:8080/gtag/js?id=G-SOMEID`
- `http://analytics-proxy.test:8080/analytics.js`
- `https://analytics-proxy.test:4443/gtm.js?id=GTM-MZJ7DB9`
- `http://analytics-proxy.test:8080/g/collect?v=2&tid=G-SOMEID&gtm=3467347as&_p=sdoui38sdk&cid=1616603405.1673937444&ul=en-us&sr=1920x1080&uaW=1&uaa=arm&uab=64&uafvl=some-user-agent&uamb=0&uam=&uap=macOS&uapv=13.1.0&uaw=0&_s=1&sid=1675776631&sct=40&seg=0&dl=some-url&dt=some-text&en=page_view&_ss=1`
