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
