// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.inbloom.content.domain;

import java.util.Set;
import org.inbloom.content.domain.Resource;
import org.inbloom.content.domain.Tag;

privileged aspect Tag_Roo_JavaBean {
    
    public String Tag.getName() {
        return this.name;
    }
    
    public void Tag.setName(String name) {
        this.name = name;
    }
    
    public Set<Resource> Tag.getResource() {
        return this.resource;
    }
    
    public void Tag.setResource(Set<Resource> resource) {
        this.resource = resource;
    }
    
}