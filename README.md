# Template to subset fonts

Creates a Docker image that you can use to create font subsets from `.ttf` files with `fonttools` and 2 node CLIs I made ([@markoskon/ftnode](https://www.npmjs.com/package/@markoskon/ftnode) and [@markoskon/scrape-url-node](https://www.npmjs.com/package/@markoskon/scrape-url-node)).

- Create and build the container: `docker compose -f docker-compose.yml up -d --build`.
- Get the unicode characters from https://example.com: `docker-compose -f docker-compose.yml exec create-fonts scrape https://example.com`
- Paste them in the `example-com-scrape.json` config file in the `unicodes` field.
- Create the font files: `docker-compose -f docker-compose.yml exec create-fonts ftnode --config example-com-scrape.json SourceSerif4Variable*ttf` or `docker-compose -f docker-compose.yml exec create-fonts ./scripts/create.sh`.
- (TODO, see Dockerfile comments) Run glyphhanger on https://example.com: `docker-compose -f docker-compose.yml exec glyphhanger https://example.com`. It seems pretty hard to run puppeteer on Docker.
- Remove the container when you're done `docker compose -f docker-compose.yml down`.
