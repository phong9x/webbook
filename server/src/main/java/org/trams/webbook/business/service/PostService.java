/*
 * Created on 6 Jan 2016 ( Time 09:41:27 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.trams.webbook.business.service;

import java.util.Date;
import java.util.List;
import org.trams.webbook.bean.jpa.PostEntity;
import org.trams.webbook.bean.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * Business Service Interface for entity Post.
 */
public interface PostService { 

	/**
	 * Loads an entity from the database using its Primary Key
	 * @param id
	 * @return entity
	 */
	Post findById( Integer id  ) ;

	/** 
	 * Loads all entities.
	 * @return all entities
	 */
	List<Post> findAll();
	
	/**
	 * Loads entities in page number.
	 * @return entities
	 */

	Page<PostEntity> findAll(Integer page);

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
	Post save(Post entity);

	/**
	 * Updates the given entity in the database
	 * @param entity
	 * @return
	 */
	Post update(Post entity);

	/**
	 * Creates the given entity in the database
	 * @param entity
	 * @return
	 */
	Post create(Post entity);
	
	/**
	 * Deletes an entity using its Primary Key
	 * @param id
	 */
	void delete( Integer id );
	
	PostEntity getById( Integer id  ) ;
	
	Page<PostEntity> listPaging(Integer page,Integer size);
	
	Page<PostEntity> listPagingSearch(String bulletinName, String nickname, String title, Integer page, Integer size);

	Page<PostEntity> findByBulletin(Integer bulletin,Integer page,Integer size,String sort);
	
	PostEntity findOne(Integer id);

	Page<PostEntity> Top10ViewFreeboard(Integer bulletin, Date from, Date to);
	

}
