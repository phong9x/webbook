/*
 * Created on 16 Feb 2016 ( Time 10:22:03 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.trams.webbook.business.service.mapping;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.stereotype.Component;
import org.trams.webbook.bean.Announcement;
import org.trams.webbook.bean.jpa.AnnouncementEntity;
import org.trams.webbook.bean.jpa.BookEntity;

/**
 * Mapping between entity beans and display beans.
 */
@Component
public class AnnouncementServiceMapper extends AbstractServiceMapper {

	/**
	 * ModelMapper : bean to bean mapping library.
	 */
	private ModelMapper modelMapper;
	
	/**
	 * Constructor.
	 */
	public AnnouncementServiceMapper() {
		modelMapper = new ModelMapper();
		modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
	}

	/**
	 * Mapping from 'AnnouncementEntity' to 'Announcement'
	 * @param announcementEntity
	 */
	public Announcement mapAnnouncementEntityToAnnouncement(AnnouncementEntity announcementEntity) {
		if(announcementEntity == null) {
			return null;
		}

		//--- Generic mapping 
		Announcement announcement = map(announcementEntity, Announcement.class);

		//--- Link mapping ( link to Book )
		if(announcementEntity.getBook() != null) {
			announcement.setBookId(announcementEntity.getBook().getId());
		}
		return announcement;
	}
	
	/**
	 * Mapping from 'Announcement' to 'AnnouncementEntity'
	 * @param announcement
	 * @param announcementEntity
	 */
	public void mapAnnouncementToAnnouncementEntity(Announcement announcement, AnnouncementEntity announcementEntity) {
		if(announcement == null) {
			return;
		}

		//--- Generic mapping 
		map(announcement, announcementEntity);

		//--- Link mapping ( link : announcement )
		if( hasLinkToBook(announcement) ) {
			BookEntity book1 = new BookEntity();
			book1.setId( announcement.getBookId() );
			announcementEntity.setBook( book1 );
		} else {
			announcementEntity.setBook( null );
		}

	}
	
	/**
	 * Verify that Book id is valid.
	 * @param Book Book
	 * @return boolean
	 */
	private boolean hasLinkToBook(Announcement announcement) {
		if(announcement.getBookId() != null) {
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