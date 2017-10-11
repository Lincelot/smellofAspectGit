// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.inbloom.content.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.persistence.PostPersist;
import javax.persistence.PostUpdate;
import javax.persistence.PreRemove;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrInputDocument;
import org.inbloom.content.domain.Use;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;

privileged aspect Use_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer Use.solrServer;
    
    public static QueryResponse Use.search(String queryString) {
        String searchString = "Use_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse Use.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void Use.indexUse(Use use) {
        List<Use> uses = new ArrayList<Use>();
        uses.add(use);
        indexUses(uses);
    }
    
    @Async
    public static void Use.indexUses(Collection<Use> uses) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (Use use : uses) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "use_" + use.getId());
            sid.addField("use.name_s", use.getName());
            sid.addField("use.id_l", use.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("use_solrsummary_t", new StringBuilder().append(use.getName()).append(" ").append(use.getId()));
            documents.add(sid);
        }
        try {
            SolrServer solrServer = solrServer();
            solrServer.add(documents);
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @Async
    public static void Use.deleteIndex(Use use) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("use_" + use.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void Use.postPersistOrUpdate() {
        indexUse(this);
    }
    
    @PreRemove
    private void Use.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer Use.solrServer() {
        SolrServer _solrServer = new Use().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}