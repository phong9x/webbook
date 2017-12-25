/*
 * Created on 15 Dec 2015 ( Time 17:20:39 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.trams.webbook.business.service;

import java.util.List;
import org.trams.webbook.bean.jpa.EpisodeEntity;
import org.trams.webbook.web.item.StatisticEpisode;
import org.trams.webbook.web.item.StatisticMember;
import org.trams.webbook.bean.Episode;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * Business Service Interface for entity Episode.
 */
public interface EpisodeService { 

	/**
	 * Loads an entity from the database using its Primary Key
	 * @param id
	 * @return entity
	 */
	Episode findById( Integer id  ) ;
	
	EpisodeEntity findOne( Integer id  ) ;

	/** 
	 * Loads all entities.
	 * @return all entities
	 */
	List<Episode> findAll();
	
	/**
	 * Loads entities in page number.
	 * @return entities
	 */

	Page<EpisodeEntity> findAll(Integer page);

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
	Episode save(Episode entity);

	/**
	 * Updates the given entity in the database
	 * @param entity
	 * @return
	 */
	Episode update(Episode entity);

	/**
	 * Creates the given entity in the database
	 * @param entity
	 * @return
	 */
	Episode create(Episode entity);
	
	/**
	 * Deletes an entity using its Primary Key
	 * @param id
	 */
	void delete( Integer id );
	
	Page<EpisodeEntity> listPaging(Integer page,Integer size);
	
	Integer totalEpisode();
	
	Integer totalNewEpisode();
	
	Integer totalSumHitNumber();
	
	Integer totalEpisodeCharge();
	
	Integer totalEpisodePurchase();
	
	Integer totalNewEpisodePurchase();
	
	StatisticEpisode caculateEpisode();
	
	Page<EpisodeEntity> listPagingByBookId(Integer id,Pageable pageable);
	
	Page<EpisodeEntity> listPagingByBookId_Temporary_Save(Integer id,Integer page, Integer size);
	
	EpisodeEntity findByEpisodeNumber(Integer id, Integer bookId);
	
	 void updateAferDelete_EpisodeNumber(Integer book_id,Integer number);
	
	 Integer totalEpisodeComplete(Integer bookid);
	 Integer totalEpisode_ByBookId(Integer book_id);
	 Integer totalEpisode_ViewNo_ByBookId(Integer bookid);
	 Integer totalEpisode_RecomentNo_ByBookId(Integer bookid);

}
