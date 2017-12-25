/*
 * Created on 21 Jan 2016 ( Time 13:45:18 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.trams.webbook.business.service.mapping;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.stereotype.Component;
import org.trams.webbook.bean.Post;
import org.trams.webbook.bean.jpa.PostEntity;
import org.trams.webbook.bean.jpa.BookEntity;
import org.trams.webbook.bean.jpa.UserEntity;

/**
 * Mapping between entity beans and display beans.
 */
@Component
public class PostServiceMapper extends AbstractServiceMapper {

	/**
	 * ModelMapper : bean to bean mapping library.
	 */
	private ModelMapper modelMapper;
	
	/**
	 * Constructor.
	 */
	public PostServiceMapper() {
		modelMapper = new ModelMapper();
		modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
	}

	/**
	 * Mapping from 'PostEntity' to 'Post'
	 * @param postEntity
	 */
	public Post mapPostEntityToPost(PostEntity postEntity) {
		if(postEntity == null) {
			return null;
		}

		//--- Generic mapping 
		Post post = map(postEntity, Post.class);

		//--- Link mapping ( link to Book )
		if(postEntity.getBook() != null) {
			post.setBookId(postEntity.getBook().getId());
		}
		//--- Link mapping ( link to User )
		if(postEntity.getUser() != null) {
			post.setUserId(postEntity.getUser().getId());
		}
		return post;
	}
	
	/**
	 * Mapping from 'Post' to 'PostEntity'
	 * @param post
	 * @param postEntity
	 */
	public void mapPostToPostEntity(Post post, PostEntity postEntity) {
		if(post == null) {
			return;
		}

		//--- Generic mapping 
		map(post, postEntity);

		//--- Link mapping ( link : post )
		if( hasLinkToBook(post) ) {
			BookEntity book1 = new BookEntity();
			book1.setId( post.getBookId() );
			postEntity.setBook( book1 );
		} else {
			postEntity.setBook( null );
		}

		//--- Link mapping ( link : post )
		if( hasLinkToUser(post) ) {
			UserEntity user2 = new UserEntity();
			user2.setId( post.getUserId() );
			postEntity.setUser( user2 );
		} else {
			postEntity.setUser( null );
		}

	}
	
	/**
	 * Verify that Book id is valid.
	 * @param Book Book
	 * @return boolean
	 */
	private boolean hasLinkToBook(Post post) {
		if(post.getBookId() != null) {
			return true;
		}
		return false;
	}

	/**
	 * Verify that User id is valid.
	 * @param User User
	 * @return boolean
	 */
	private boolean hasLinkToUser(Post post) {
		if(post.getUserId() != null) {
			return true;
		}
		return false;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	protected ModelMapper getModelMapper() {
		return modelMapper;
	}

	protected void setModelMapper(ModelMapper modelMapper) {
		this.modelMapper = modelMapper;
	}

}