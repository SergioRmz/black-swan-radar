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

- Java 21 + Maven
- Docker socket mount for Testcontainers (`/var/run/docker.sock`)
- OpenCode credentials mount from host (`~/.config/opencode` -> `/root/.config/opencode`)
- Recommended VS Code extensions for Java/Spring
- Post-create automation via `.devcontainer/setup.sh`

How to use it:

1. Install Docker Desktop (or Docker Engine) and VS Code.
2. Install the VS Code extension `Dev Containers`.
3. Open the repository in VS Code.
4. Run `Dev Containers: Reopen in Container`.

The post-create setup script performs:

- Install missing base tools when needed (`maven`, `curl`)
- Disable broken third-party APT repos that can block updates (e.g. `dl.yarnpkg.com` with missing keys)
- Maven validation (`mvn -v`)
- Maven dependency warmup (`mvn -DskipTests dependency:go-offline`)
- OpenCode installation (`curl -fsSL https://opencode.ai/install | bash`)
