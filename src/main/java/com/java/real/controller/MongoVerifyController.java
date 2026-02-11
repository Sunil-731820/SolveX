package com.java.real.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

@RestController
public class MongoVerifyController {

    @Autowired
    MongoTemplate mongoTemplate;

    @GetMapping("/mongo-db")
    public String db() {
    	System.out.println("Calling tge Db for MongoDB :"+mongoTemplate.getDb().getName());
    	try (MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017")) {
            MongoDatabase database = mongoClient.getDatabase("codeBloomDatabaseDEVToPRDMongoDB");

            // Print all collection names
            for (String name : database.listCollectionNames()) {
                System.out.println("Collection: " + name);
            }
        }
        return mongoTemplate.getDb().getName();
    }
}
