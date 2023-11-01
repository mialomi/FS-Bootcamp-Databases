db.createCollection("Proveidor", {
    "capped": false,
    "validator": {
        "$jsonSchema": {
            "bsonType": "object",
            "title": "Proveidor",
            "properties": {
                "_id": {
                    "bsonType": "objectId"
                },
                "id": {
                    "bsonType": "objectId"
                },
                "Nom": {
                    "bsonType": "string"
                },
                "Direccio": {
                    "bsonType": "array",
                    "additionalItems": true,
                    "items": [
                        {
                            "bsonType": "string"
                        },
                        {
                            "bsonType": "int"
                        },
                        {
                            "bsonType": "number"
                        },
                        {
                            "bsonType": "string"
                        },
                        {
                            "bsonType": "string"
                        },
                        {
                            "bsonType": "number"
                        },
                        {
                            "bsonType": "string"
                        }
                    ]
                },
                "Telefon": {
                    "bsonType": "int"
                },
                "Correu": {
                    "bsonType": "string"
                },
                "NIF": {
                    "bsonType": "string"
                }
            },
            "additionalProperties": false,
            "required": [
                "id",
                "Nom",
                "Direccio",
                "Telefon",
                "Correu",
                "NIF"
            ]
        }
    },
    "validationLevel": "off",
    "validationAction": "warn"
});