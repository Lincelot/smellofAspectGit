// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.saas.golf.domain;

import com.saas.golf.domain.GolfRound;
import com.saas.golf.domain.GolfRoundDataOnDemand;
import com.saas.golf.domain.ScoreCard;
import com.saas.golf.domain.ScoreCardDataOnDemand;
import com.saas.golf.repository.GolfRoundRepository;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect GolfRoundDataOnDemand_Roo_DataOnDemand {
    
    declare @type: GolfRoundDataOnDemand: @Component;
    
    private Random GolfRoundDataOnDemand.rnd = new SecureRandom();
    
    private List<GolfRound> GolfRoundDataOnDemand.data;
    
    @Autowired
    private ScoreCardDataOnDemand GolfRoundDataOnDemand.scoreCardDataOnDemand;
    
    @Autowired
    GolfRoundRepository GolfRoundDataOnDemand.golfRoundRepository;
    
    public GolfRound GolfRoundDataOnDemand.getNewTransientGolfRound(int index) {
        GolfRound obj = new GolfRound();
        setDateCreated(obj, index);
        setInProgress(obj, index);
        setScoreCard(obj, index);
        return obj;
    }
    
    public void GolfRoundDataOnDemand.setDateCreated(GolfRound obj, int index) {
        Date dateCreated = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setDateCreated(dateCreated);
    }
    
    public void GolfRoundDataOnDemand.setInProgress(GolfRound obj, int index) {
        Boolean inProgress = Boolean.TRUE;
        obj.setInProgress(inProgress);
    }
    
    public void GolfRoundDataOnDemand.setScoreCard(GolfRound obj, int index) {
        ScoreCard scoreCard = scoreCardDataOnDemand.getRandomScoreCard();
        obj.setScoreCard(scoreCard);
    }
    
    public GolfRound GolfRoundDataOnDemand.getSpecificGolfRound(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        GolfRound obj = data.get(index);
        BigInteger id = obj.getId();
        return golfRoundRepository.findOne(id);
    }
    
    public GolfRound GolfRoundDataOnDemand.getRandomGolfRound() {
        init();
        GolfRound obj = data.get(rnd.nextInt(data.size()));
        BigInteger id = obj.getId();
        return golfRoundRepository.findOne(id);
    }
    
    public boolean GolfRoundDataOnDemand.modifyGolfRound(GolfRound obj) {
        return false;
    }
    
    public void GolfRoundDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = golfRoundRepository.findAll(new org.springframework.data.domain.PageRequest(from / to, to)).getContent();
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'GolfRound' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<GolfRound>();
        for (int i = 0; i < 10; i++) {
            GolfRound obj = getNewTransientGolfRound(i);
            try {
                golfRoundRepository.save(obj);
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            data.add(obj);
        }
    }
    
}