package org.trams.webbook.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.trams.webbook.bean.jpa.BookViewingEntity;
import org.trams.webbook.bean.jpa.InterestedBookEntity;

/**
 * Repository : BookViewing.
 */
public interface BookViewingJpaRepository extends PagingAndSortingRepository<BookViewingEntity, Integer> {
	@Query(
			"Select u From BookViewingEntity u "
			)
	Page<BookViewingEntity> listPaging(Pageable pageable);
	
	@Query(
			"Select u From BookViewingEntity u where u.user.id=?1"
			)
	List<BookViewingEntity> findBy_UserId(Integer userId);
}
