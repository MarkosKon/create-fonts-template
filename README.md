- Create and build the container: `docker compose -f docker-compose.yml up -d --build`.
- Create the fonts: `docker-compose -f docker-compose.yml exec create-fonts ./scripts/create.sh`.
- Run glyphhanger on https://markoskon.com: `docker-compose -f docker-compose.yml exec glyphhanger https://markoskon.com`.
- Remove the container `docker compose -f docker-compose.yml down`.