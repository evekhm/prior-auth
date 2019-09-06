BEGIN TRANSACTION;

    CREATE TABLE IF NOT EXISTS Bundle (
        "id" varchar PRIMARY KEY,
        "patient" varchar,
        "timestamp" datetime DEFAULT CURRENT_TIMESTAMP,
        "resource" clob
    );

    CREATE TABLE IF NOT EXISTS Claim (
        "id" varchar PRIMARY KEY,
        "patient" varchar,
        "related" varchar DEFAULT NULL,
        "status" varchar,
        "timestamp" datetime DEFAULT CURRENT_TIMESTAMP,
        "resource" clob,
        FOREIGN KEY ("related") REFERENCES Claim("id") ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS ClaimResponse (
        "id" varchar PRIMARY KEY,
        "claimId" varchar,
        "patient" varchar,
        "status" varchar,
        "timestamp" datetime DEFAULT CURRENT_TIMESTAMP,
        "resource" clob,
        FOREIGN KEY ("claimId") REFERENCES Claim("id") ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS ClaimItem (
        "id" varchar,
        "sequence" varchar,
        "status" varchar,
        "timestamp" datetime DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT pk_claimitems PRIMARY KEY ("id", "sequence"),
        FOREIGN KEY ("id") REFERENCES Claim("id") ON DELETE CASCADE
    );

COMMIT;