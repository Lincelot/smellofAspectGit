// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.inbloom.content.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;
import org.inbloom.content.domain.Pathway;

privileged aspect Pathway_Roo_Jpa_Entity {
    
    declare @type: Pathway: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Pathway.id;
    
    @Version
    @Column(name = "version")
    private Integer Pathway.version;
    
    public Long Pathway.getId() {
        return this.id;
    }
    
    public void Pathway.setId(Long id) {
        this.id = id;
    }
    
    public Integer Pathway.getVersion() {
        return this.version;
    }
    
    public void Pathway.setVersion(Integer version) {
        this.version = version;
    }
    
}