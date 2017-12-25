package org.trams.webbook.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.trams.webbook.bean.jpa.AnnouncementEntity;

/**
 * Repository : Announcement.
 */
public interface AnnouncementJpaRepository extends PagingAndSortingRepository<AnnouncementEntity, Integer> {
	@Query(
			"Select u From AnnouncementEntity u where u.isDelete!=1"
			)
	Page<AnnouncementEntity> listPaging(Pageable pageable);
	
	
	@Query(
			"Select u From AnnouncementEntity u where u.isDelete!=1 and u.book.id=?1"
			)
	Page<AnnouncementEntity> listPagingByBookId(Integer book_id,Pageable pageable);
}
