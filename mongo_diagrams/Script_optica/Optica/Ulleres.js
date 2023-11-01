db.createCollection("Ulleres", {
    "capped": false,
    "validator": {
        "$jsonSchema": {
            "bsonType": "object",
            "title": "Ulleres",
            "properties": {
                "_id": {
                    "bsonType": "objectId"
                },
                "id": {
                    "bsonType": "objectId"
                },
                "Marca": {
                    "bsonType": "objectId"
                },
                "Graduacio": {
                    "bsonType": "array",
                    "additionalItems": true,
                    "items": [
                        {
                            "bsonType": "decimal"
                        },
                        {
                            "bsonType": "decimal"
                        }
                    ]
                },
                "Montura": {
                    "bsonType": "string",
                    "enum": [
                        "Pasta",
                        "Flotant",
                        "Metalica"
                    ]
                },
                "Color_vidre_dret": {
                    "bsonType": "string",
                    "enum": [
                        "Gris",
                        "Verd",
                        "Marro",
                        "Groc",
                        "Taronja"
                    ]
                },
                "Color_vidre_esquerre": {
                    "bsonType": "string",
                    "enum": [
                        "Gris",
                        "Verd",
                        "Marro",
                        "Groc",
                        "Taronja"
                    ]
                },
                "Preu": {
                    "bsonType": "decimal"
                }
            },
            "additionalProperties": false,
            "required": [
                "id",
                "Marca",
                "Graduacio",
                "Montura",
                "Color_vidre_dret",
                "Color_vidre_esquerre"
            ]
        }
    },
    "validationLevel": "off"
});