db.createCollection("Marca", {
    "capped": false,
    "validator": {
        "$jsonSchema": {
            "bsonType": "object",
            "title": "Marca",
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
                "Proveidor": {
                    "bsonType": "string"
                }
            },
            "additionalProperties": false,
            "required": [
                "Id",
                "Nom",
                "Proveidor"
            ]
        }
    },
    "validationLevel": "off",
    "validationAction": "warn"
});