// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.inbloom.content.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.inbloom.content.domain.PathwayNode;

privileged aspect PathwayNode_Roo_Json {
    
    public String PathwayNode.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public String PathwayNode.toJson(String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").serialize(this);
    }
    
    public static PathwayNode PathwayNode.fromJsonToPathwayNode(String json) {
        return new JSONDeserializer<PathwayNode>().use(null, PathwayNode.class).deserialize(json);
    }
    
    public static String PathwayNode.toJsonArray(Collection<PathwayNode> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static String PathwayNode.toJsonArray(Collection<PathwayNode> collection, String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<PathwayNode> PathwayNode.fromJsonArrayToPathwayNodes(String json) {
        return new JSONDeserializer<List<PathwayNode>>().use(null, ArrayList.class).use("values", PathwayNode.class).deserialize(json);
    }
    
}