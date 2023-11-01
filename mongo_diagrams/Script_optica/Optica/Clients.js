db.createCollection("Clients", {
    "capped": false,
    "validator": {
        "$jsonSchema": {
            "bsonType": "object",
            "title": "Clients",
            "properties": {
                "_id": {
                    "bsonType": "objectId"
                },
                "Id": {
                    "bsonType": "objectId"
                },
                "Nom": {
                    "bsonType": "string"
                },
                "Cognom1": {
                    "bsonType": "string"
                },
                "Cognom2": {
                    "bsonType": "string"
                },
                "Correu": {
                    "bsonType": "string"
                },
                "Telefon": {
                    "bsonType": "int"
                },
                "Direccio": {
                    "bsonType": "string"
                },
                "Data_registre": {
                    "bsonType": "string"
                },
                "Recomanat": {
                    "bsonType": "objectId"
                }
            },
            "additionalProperties": false,
            "required": [
                "Id",
                "Nom",
                "Cognom1",
                "Cognom2",
                "Correu",
                "Telefon",
                "Data_registre"
            ]
        }
    },
    "validationLevel": "off",
    "validationAction": "warn"
});