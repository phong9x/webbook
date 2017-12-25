/*
 * Created on 21 Jan 2016 ( Time 11:04:32 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.trams.webbook.business.service.mapping;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.stereotype.Component;
import org.trams.webbook.bean.Visitor;
import org.trams.webbook.bean.jpa.VisitorEntity;

/**
 * Mapping between entity beans and display beans.
 */
@Component
public class VisitorServiceMapper extends AbstractServiceMapper {

	/**
	 * ModelMapper : bean to bean mapping library.
	 */
	private ModelMapper modelMapper;
	
	/**
	 * Constructor.
	 */
	public VisitorServiceMapper() {
		modelMapper = new ModelMapper();
		modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
	}

	/**
	 * Mapping from 'VisitorEntity' to 'Visitor'
	 * @param visitorEntity
	 */
	public Visitor mapVisitorEntityToVisitor(VisitorEntity visitorEntity) {
		if(visitorEntity == null) {
			return null;
		}

		//--- Generic mapping 
		Visitor visitor = map(visitorEntity, Visitor.class);

		return visitor;
	}
	
	/**
	 * Mapping from 'Visitor' to 'VisitorEntity'
	 * @param visitor
	 * @param visitorEntity
	 */
	public void mapVisitorToVisitorEntity(Visitor visitor, VisitorEntity visitorEntity) {
		if(visitor == null) {
			return;
		}

		//--- Generic mapping 
		map(visitor, visitorEntity);

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