/*
 * Created on 2 Feb 2016 ( Time 15:32:56 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
// This Bean has a basic Primary Key (not composite) 

package org.trams.webbook.bean.jpa;

import java.io.Serializable;

//import javax.validation.constraints.* ;
//import org.hibernate.validator.constraints.* ;


import javax.persistence.*;

/**
 * Persistent class for entity stored in table "visitor"
 *
 * @author Telosys Tools Generator
 *
 */

@Entity
@Table(name="visitor", catalog="webbook" )
// Define named queries here
@NamedQueries ( {
  @NamedQuery ( name="VisitorEntity.countAll", query="SELECT COUNT(x) FROM VisitorEntity x" )
} )
public class VisitorEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    //----------------------------------------------------------------------
    // ENTITY PRIMARY KEY ( BASED ON A SINGLE FIELD )
    //----------------------------------------------------------------------
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="_id", nullable=false)
    private Integer    id           ;


    //----------------------------------------------------------------------
    // ENTITY DATA FIELDS 
    //----------------------------------------------------------------------    
    @Column(name="total_visitor")
    private Integer    totalVisitor ;

    @Column(name="today_visitor")
    private Integer    todayVisitor ;



    //----------------------------------------------------------------------
    // ENTITY LINKS ( RELATIONSHIP )
    //----------------------------------------------------------------------

    //----------------------------------------------------------------------
    // CONSTRUCTOR(S)
    //----------------------------------------------------------------------
    public VisitorEntity() {
		super();
    }
    
    //----------------------------------------------------------------------
    // GETTER & SETTER FOR THE KEY FIELD
    //----------------------------------------------------------------------
    public void setId( Integer id ) {
        this.id = id ;
    }
    public Integer getId() {
        return this.id;
    }

    //----------------------------------------------------------------------
    // GETTERS & SETTERS FOR FIELDS
    //----------------------------------------------------------------------
    //--- DATABASE MAPPING : total_visitor ( INT ) 
    public void setTotalVisitor( Integer totalVisitor ) {
        this.totalVisitor = totalVisitor;
    }
    public Integer getTotalVisitor() {
        return this.totalVisitor;
    }

    //--- DATABASE MAPPING : today_visitor ( INT ) 
    public void setTodayVisitor( Integer todayVisitor ) {
        this.todayVisitor = todayVisitor;
    }
    public Integer getTodayVisitor() {
        return this.todayVisitor;
    }


    //----------------------------------------------------------------------
    // GETTERS & SETTERS FOR LINKS
    //----------------------------------------------------------------------

    //----------------------------------------------------------------------
    // toString METHOD
    //----------------------------------------------------------------------
    public String toString() { 
        StringBuffer sb = new StringBuffer(); 
        sb.append("["); 
        sb.append(id);
        sb.append("]:"); 
        sb.append(totalVisitor);
        sb.append("|");
        sb.append(todayVisitor);
        return sb.toString(); 
    } 

}
