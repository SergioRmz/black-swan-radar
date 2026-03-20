create table instruments (
    id bigserial primary key,
    symbol varchar(20) not null unique,
    name varchar(120) not null,
    type varchar(30) not null,
    base_currency varchar(10),
    quote_currency varchar(10),
    source varchar(50) not null,
    created_at timestamptz not null default current_timestamp
);
