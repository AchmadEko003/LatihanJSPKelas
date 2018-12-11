/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.math.BigInteger;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Nitani
 */
@Entity
@Table(name = "JOB_GRADES")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "JobGrades.findAll", query = "SELECT j FROM JobGrades j")
    , @NamedQuery(name = "JobGrades.findByGradeLevel", query = "SELECT j FROM JobGrades j WHERE j.gradeLevel = :gradeLevel")
    , @NamedQuery(name = "JobGrades.findByLowestSal", query = "SELECT j FROM JobGrades j WHERE j.lowestSal = :lowestSal")
    , @NamedQuery(name = "JobGrades.findByHighestSal", query = "SELECT j FROM JobGrades j WHERE j.highestSal = :highestSal")})
public class JobGrades implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "GRADE_LEVEL")
    private String gradeLevel;
    @Column(name = "LOWEST_SAL")
    private BigInteger lowestSal;
    @Column(name = "HIGHEST_SAL")
    private BigInteger highestSal;

    public JobGrades() {
    }

    public JobGrades(String gradeLevel) {
        this.gradeLevel = gradeLevel;
    }

    public JobGrades(String gradeLevel, BigInteger lowestSal, BigInteger highestSal) {
        this.gradeLevel = gradeLevel;
        this.lowestSal = lowestSal;
        this.highestSal = highestSal;
    }

    public String getGradeLevel() {
        return gradeLevel;
    }

    public void setGradeLevel(String gradeLevel) {
        this.gradeLevel = gradeLevel;
    }

    public BigInteger getLowestSal() {
        return lowestSal;
    }

    public void setLowestSal(BigInteger lowestSal) {
        this.lowestSal = lowestSal;
    }

    public BigInteger getHighestSal() {
        return highestSal;
    }

    public void setHighestSal(BigInteger highestSal) {
        this.highestSal = highestSal;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (gradeLevel != null ? gradeLevel.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof JobGrades)) {
            return false;
        }
        JobGrades other = (JobGrades) object;
        if ((this.gradeLevel == null && other.gradeLevel != null) || (this.gradeLevel != null && !this.gradeLevel.equals(other.gradeLevel))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.JobGrades[ gradeLevel=" + gradeLevel + " ]";
    }
    
}
