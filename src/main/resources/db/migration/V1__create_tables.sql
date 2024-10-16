CREATE TABLE IF NOT EXISTS users
(
    id        BIGINT       NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(256) NOT NULL UNIQUE,
    email     VARCHAR(256) NOT NULL UNIQUE,
    password  VARCHAR(256) NOT NULL,
    role      VARCHAR(50)  NOT NULL,
    created   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status    VARCHAR(25)  DEFAULT 'ACTIVE'
);



CREATE TABLE IF NOT EXISTS files
(
    id        BIGINT       NOT NULL AUTO_INCREMENT PRIMARY KEY,
    file_name VARCHAR(256) NOT NULL UNIQUE,
    location  VARCHAR(256) NOT NULL,
    created   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status    VARCHAR(25)  DEFAULT 'ACTIVE'
);


CREATE TABLE IF NOT EXISTS events
(
    id        BIGINT    NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id   BIGINT    NOT NULL,
    file_id   BIGINT    NOT NULL,
    created   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status    VARCHAR(25) DEFAULT 'ACTIVE',
    CONSTRAINT fk_events_user_id FOREIGN KEY (user_id) REFERENCES users (id),
    CONSTRAINT fk_events_file_id FOREIGN KEY (file_id) REFERENCES files (id),
    UNIQUE (user_id, file_id)
);

