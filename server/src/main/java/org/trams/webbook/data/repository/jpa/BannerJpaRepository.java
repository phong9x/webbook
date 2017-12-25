package org.trams.webbook.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.trams.webbook.bean.jpa.BannerEntity;

/**
 * Repository : Banner.
 */
public interface BannerJpaRepository extends PagingAndSortingRepository<BannerEntity, Integer> {
	@Query(
			"Select u From BannerEntity u "
			)
	Page<BannerEntity> listPaging(Pageable pageable);
}
