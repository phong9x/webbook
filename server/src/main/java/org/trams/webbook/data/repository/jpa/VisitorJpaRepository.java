package org.trams.webbook.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.trams.webbook.bean.jpa.VisitorEntity;

/**
 * Repository : Visitor.
 */
public interface VisitorJpaRepository extends PagingAndSortingRepository<VisitorEntity, Integer> {
	@Query(
			"Select u From VisitorEntity u "
			)
	Page<VisitorEntity> listPaging(Pageable pageable);
	
	@Query(
			value="Update book set HITS_WEEKLY=0,INTERESTED_WEEKLY=0,RECOMMENDATION_WEEKLY=0 where HITS_WEEKLY>0 or INTERESTED_WEEKLY>0 or RECOMMENDATION_WEEKLY>0 and IS_DELETE=0",nativeQuery = true
			)
	Integer totalSumAmountUser(Integer year, Integer month);
	
	
}
