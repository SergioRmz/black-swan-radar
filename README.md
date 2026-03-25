# black-swan-radar

Backend service for tracking and analyzing market-impacting economic events.

## Tech stack

- Java 21
- Spring Boot 3.5.x
- Maven
- PostgreSQL
- Flyway
- Testcontainers

## Included dependencies

- Spring Web
- Spring Validation
- Spring Data JPA
- PostgreSQL Driver
- Flyway
- Spring Boot Actuator
- Spring Boot Test
- Testcontainers for PostgreSQL

## Prerequisites

- JDK 21 installed and active
- Maven 3.9+
- Docker (for integration tests with Testcontainers)

## Project structure

- `src/main/java/com/blackswan/radar`: main application code
- `src/main/resources`: configuration files
- `src/test/java/com/blackswan/radar`: test code

## Run locally

```bash
mvn spring-boot:run
```

## Run tests

```bash
mvn test
```

## Notes

- The project is configured for Java 21 (`<java.version>21</java.version>` in `pom.xml`).
- If your environment is using a lower JDK version, Maven build and tests will fail with: `release version 21 not supported`.

## Development container

This repository includes a Dev Container config in `.devcontainer/devcontainer.json` so you can work without installing Java/Maven locally.

Included in the container:

- Java 21 + Maven from custom image (`.devcontainer/Dockerfile`)
- Docker CLI available inside the container
- Docker socket mount for Testcontainers (`/var/run/docker.sock`)
- OpenCode credentials mount from host (`~/.local/share/opencode` -> `/root/.local/share/opencode`)
- Recommended VS Code extensions for Java/Spring
- Post-create automation via `.devcontainer/setup.sh`

Environment files:

- App + Devcontainer variables: `/.env` (template: `/.env.example`)

Export helper script:

- Versioned script: `scripts/export-env.sh`
- Load variables into current shell: `source scripts/export-env.sh`
- Optional custom file: `source scripts/export-env.sh path/to/.env`

Variable naming notes:

- The application reads `DB_*` variables from `/.env`.
- PostgreSQL reads `POSTGRES_*` variables from the same `/.env` file.

## Flyway

- Migrations are stored in `src/main/resources/db/migration`.
- Versioned scripts follow: `V<version>__<description>.sql`.
- The Maven Flyway plugin is configured in `pom.xml`.
- By default, plugin commands target local PostgreSQL (`localhost:5432`, `black_swan_radar`, `postgres/postgres`).
- If `DB_HOST` is present in the environment (for example inside the devcontainer), plugin commands automatically use `DB_*` variables.

Useful commands:

```bash
mvn flyway:info
mvn flyway:migrate
```

How to use it:

1. Install Docker Desktop (or Docker Engine) and VS Code.
2. Install the VS Code extension `Dev Containers`.
3. Create local env files:
   - `cp .env.example .env`
4. Open the repository in VS Code.
5. Run `Dev Containers: Reopen in Container`.

The post-create setup script performs:

- Maven validation (`mvn -v`)
- Docker CLI validation (`docker --version`)
- Docker Compose v2 validation (`docker compose version`)
- Curl validation (`curl --version`)
- Maven dependency warmup (`mvn -DskipTests dependency:go-offline`)
- OpenCode installation (`curl -fsSL https://opencode.ai/install | bash`)
