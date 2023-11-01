db.createCollection("Nova compra", {
    "capped": false,
    "validator": {
        "$jsonSchema": {
            "bsonType": "object",
            "title": "Nova compra",
            "properties": {
                "_id": {
                    "bsonType": "objectId"
                },
                "id": {
                    "bsonType": "objectId"
                },
                "Treballador": {
                    "bsonType": "objectId"
                },
                "Registre_data": {
                    "bsonType": "string"
                },
                "Client": {
                    "bsonType": "objectId"
                },
                "Comanda": {
                    "bsonType": "array",
                    "additionalItems": true,
                    "items": [
                        {
                            "bsonType": "int"
                        },
                        {
                            "bsonType": "objectId"
                        }
                    ]
                }
            },
            "additionalProperties": false,
            "required": [
                "id",
                "Treballador",
                "Registre_data",
                "Client"
            ]
        }
    },
    "validationLevel": "off",
    "validationAction": "warn"
});