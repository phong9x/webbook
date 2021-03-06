/*
 * Created on 15 Dec 2015 ( Time 17:20:40 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.trams.webbook.business.service;

import java.util.List;

import org.trams.webbook.bean.jpa.CommentEntity;
import org.trams.webbook.bean.jpa.PostEntity;
import org.trams.webbook.bean.jpa.ReportEntity;
import org.trams.webbook.bean.Report;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * Business Service Interface for entity Report.
 */
public interface ReportService { 

	/**
	 * Loads an entity from the database using its Primary Key
	 * @param id
	 * @return entity
	 */
	Report findById( Integer id  ) ;

	/** 
	 * Loads all entities.
	 * @return all entities
	 */
	List<Report> findAll();
	
	/**
	 * Loads entities in page number.
	 * @return entities
	 */

	Page<ReportEntity> findAll(Integer page);

	/**
	 * Count all entities
	 * @return Long
	 */
	Long countTotal();
	

	/**
	 * Saves the given entity in the database (create or update)
	 * @param entity
	 * @return entity
	 */
	Report save(Report entity);

	/**
	 * Updates the given entity in the database
	 * @param entity
	 * @return
	 */
	Report update(Report entity);

	/**
	 * Creates the given entity in the database
	 * @param entity
	 * @return
	 */
	Report create(Report entity);
	
	/**
	 * Deletes an entity using its Primary Key
	 * @param id
	 */
	void delete( Integer id );
	
	Report findByUserParrentType( Integer userid,Integer parrent,String tpye  ) ;
	
	Page<ReportEntity> listPaging(Integer page,Integer size);
	
	Page<ReportEntity> listPagingBy_Type(String type,Integer page,Integer size);
	
	Page<CommentEntity> listCommentReport(Integer page, Integer size);

	Page<PostEntity> listPostReport(Integer page, Integer size);
	
	List<ReportEntity> listPopupHistory(Integer id,String type);


}
